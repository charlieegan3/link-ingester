require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "pretty prints urls" do
    link = Link.new(url: "http://www.google.com/things/")
    assert link.pretty_url == "google.com/things"
  end
end
