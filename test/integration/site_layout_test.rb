require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    # Get the root path (Home page)
    get root_path
    # Verify that the right page template is rendered
    assert_template 'static_pages/home'
    # Check for the correct links
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", about_path
    # assert_select "a[href=?]", help_path
    # assert_select "a[href=?]", contact_path

    # Get the signup path
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
