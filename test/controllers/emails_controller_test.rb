require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should create email" do
    assert_difference('Email.count', 1) do
      post "/emails", params: {
        email: {
          from_name: "Charlie",
          from_email: "me@charlie.com",
          subject: "Example Subject",
          html: "<p><a href=\"http://www.charlie.com\">charlie.com</a></p>",
        }
      }
    end
    assert_response :success
    assert (
      %w(from_name from_email subject html) - JSON.parse(response.body).keys
    ).empty?
  end

  test "should create plain email" do
    assert_difference('Email.count', 1) do
      post "/emails", params: {
        plain: "this is a link: http://charlie.com",
        email: {
          from_name: "Charlie",
          from_email: "me@charlie.com",
          subject: "Example Subject",
        }
      }
    end
    assert_response :success
  end

  test "should list email" do
    get "/emails"
    assert_response :success
    email = emails(:simple)
    assert_select "li", "#{email.from_name} - #{email.subject}"
  end

  test "should show email" do
    email = emails(:simple)
    get email_path(email)
    assert_response :success
    assert_select "h1", email.subject
    assert_select "div#email-body", "Charlie"
  end

  test "should destroy email" do
    email = emails(:simple)
    assert_difference('Email.count', -1) do
      delete email_path(email)
    end
    assert_redirected_to emails_path
  end
end
