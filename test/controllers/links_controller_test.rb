require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "shows the index page" do
    get "/links"
    assert_response :success
  end

  test "should show link" do
    Link.create(url: "http://google.com")
    get "/links"
    assert_response :success
    assert response.body.include? "google.com"
  end
end
