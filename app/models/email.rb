class Email < ApplicationRecord
  validates :html, presence: true

  def links
    if html.match(/\/>|<a|<p|\w+="/)
      Nokogiri::HTML(html).css("a").map { |a| { text: a.text, url: a["href"] } }
    else
      html.scan(/https?\S+/).map { |url| { text: nil, url: url } }
    end
  end
end
