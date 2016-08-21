require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "shows the index page" do
    get "/links"
    assert_response :success
  end

  test "should show link" do
    EmailLink.create(email: emails(:simple), source_url: "http://google.com", title: "link title")
    get "/links"
    assert_response :success
    assert response.body.include? "link title"
  end
end
