require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "pretty prints urls" do
    link = Link.new(url: "http://www.google.com/things/")
    assert link.pretty_url == "google.com/things"
  end

  test "populates meta" do
    link = Link.create(url: "http://www.spacex.com/hyperloop")
    assert link.title == "Hyperloop SpaceX"
    assert link.description == "The Official SpaceX Hyperloop Pod Competition Watch archived Design Weekend webcast"
    assert link.hn_status != 0
  end
end
