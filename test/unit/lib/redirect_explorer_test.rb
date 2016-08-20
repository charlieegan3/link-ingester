require 'test_helper'

class RedirectExplorerTest < ActiveSupport::TestCase
  test "it expands a url" do
    url = "http://bit.ly/19y8wyr"
    final = RedirectExplorer.new.explore(url)
    assert final == "https://news.ycombinator.com/"
  end
end
