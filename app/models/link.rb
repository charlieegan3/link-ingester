class Link < ApplicationRecord
  has_many :email_links, dependent: :destroy

  before_validation :populate_meta

  def populate_meta
    page = MetaInspector.new(self.url)
    self.title = page.title.gsub(/\W+/, " ").gsub(/\s+/, " ")
    self.description = page.description.gsub(/\s+/, " ")
    self.hn_status = fetch_hn_status != 0
  end

  def fetch_hn_status
    begin
      query = self.title.downcase.split(/\W+/).join("%20")
      query_url = "https://hn.algolia.com/api/v1/search?tags=story&numericFilters=created_at_i%3E#{(Date.today - 365).to_time.to_i}&query=#{query}"
      result = Curl::Easy.perform(query_url) do |curl|
        curl.head = true
        curl.follow_location = true
        curl.connect_timeout_ms = 2000
      end
      return JSON.parse(result.body)['nbHits']
    rescue
      return 0
    end
  end

  def pretty_url
    begin
      uri = URI.parse(self.url)
      "#{uri.host}#{uri.path}".gsub(/^www\.|\/+$/, "")
    rescue
      self.url
    end
  end

  def self.find_or_create_by_url(url)
    link = find_by_url(url) ? link : Link.create(url: url)
  end
end
