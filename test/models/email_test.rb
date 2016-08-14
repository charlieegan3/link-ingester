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
end
