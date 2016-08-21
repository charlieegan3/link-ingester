class Email < ApplicationRecord
  validates :html, presence: true

  after_create :save_links

  def save_links
    content_links.each do |link|
      EmailLink.create(email: self, source_url: link[:url])
    end
  end

  def links
    if html.match(/\/>|<a|<p|\w+="/)
      Nokogiri::HTML(html)
        .css("a")
        .map { |a| { text: a.text, url: a["href"] } }
        .reject { |a| a[:text].strip == "" }
    else
      html.scan(/https?\S+/).map { |url| { text: nil, url: url } }
    end
  end

  def content_links
    text_pattern = /subscri|(update|manage) your preferences|read this (e\-?mail|issue)? on the web/i
    url_pattern = /subscri|list\-manage\.com\/(profile|unsub)/i
    links.reject do |l|
      l[:text].match(text_pattern) ||
        l[:url].match(url_pattern) ||
        l[:text].split(/\s+/).size == 1
    end
  end
end
