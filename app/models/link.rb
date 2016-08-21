class Link < ApplicationRecord
  has_many :email_links, dependent: :destroy

  def pretty_url
    uri = URI.parse(self.url)
    "#{uri.host}#{uri.path}".gsub(/^www\.|\/+$/, "")
  end

  def self.find_or_create_by_url(url)
    link = find_by_url(url) ? link : Link.create(url: url)
  end
end
