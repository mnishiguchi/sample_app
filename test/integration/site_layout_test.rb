require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    # 1. Get the root path (Home page)
    get root_path
    # 2. Verify that the right page template is rendered
    assert_template 'static_pages/home'
    # 3. Check for the correct links
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
  end
end
