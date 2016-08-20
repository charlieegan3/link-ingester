require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  test "links are extracted from HTML" do
    email = emails(:simple)
    assert email.links == [{ text: "Charlie", url: "http://charlie.com" }]
  end

  test "image links are ignored" do
    email = emails(:image_link)
    assert email.links == []
  end

  test "links are extracted from plain body emails" do
    email = emails(:plain)
    assert email.links == [{ text: nil, url: "http://charlie.com" }]
  end

  test "unsubscribe links are filtered" do
    email = emails(:newsletter)
    assert email.content_links == [
      { text: "Really great site", url: "http://charlie.com" },
      { text: "Really great site", url: "http://androidweekly.us2.list-manage.com/track/click" },
    ]
  end

  test "links with short titles are rejected" do
    email = emails(:varying_link_length)
    assert email.content_links == [
      { text: "This is a really amazing article", url: "http://google.com" },
    ]
  end
end
