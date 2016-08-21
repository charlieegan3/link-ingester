require 'test_helper'

class EmailLinkTest < ActiveSupport::TestCase
  setup do
    RedirectExplorer.any_instance.stubs(:explore).returns("http://google.com")
    Link.destroy_all
  end

  test "creates link if not present" do
    email = emails(:simple)
    el = EmailLink.create(email: email, source_url: "http://bit.ly/1234")
    assert Link.count == 1
    assert Link.first.url == "http://google.com"
    assert el.link == Link.first
    assert el.source_url == "http://bit.ly/1234"
  end

  test "uses existing link if present" do
    email = emails(:simple)
    Link.create(url: "http://google.com")
    el = EmailLink.create(email: email, source_url: "http://bit.ly/1234")
    assert el.link = Link.first
    assert Link.count == 1
  end
end
