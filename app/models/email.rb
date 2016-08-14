class Email < ApplicationRecord
  validates :html, presence: true

  def links
    if html.match(/\/>|<a|<p|\w+="/)
      Nokogiri::HTML(html).css("a").map { |a| { text: a.text, url: a["href"] } }
    else
      html.scan(/https?\S+/).map { |url| { text: nil, url: url } }
    end
  end

  def content_links
    text_pattern = /subscri|(update|manage) your preferences/i
    url_pattern = /subscri|list\-manage\.com\/(profile|unsub)/i
    links.reject do |l|
      l[:text].match(text_pattern) || l[:url].match(url_pattern)
    end
  end
end
