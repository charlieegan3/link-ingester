require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  test "links are extracted from HTML" do
    email = emails(:simple)
    assert email.links == [{ text: "Charlie", url: "http://charlie.com" }]
  end

  test "links are extracted from plain body emails" do
    email = emails(:plain)
    assert email.links == [{ text: nil, url: "http://charlie.com" }]
  end

  test "unsubscribe links are filtered" do
    email = emails(:newsletter)
    assert email.content_links == [
      { text: "Charlie", url: "http://charlie.com" },
      { text: "Charlie", url: "http://androidweekly.us2.list-manage.com/track/click" },
    ]
  end
end
