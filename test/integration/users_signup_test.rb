require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation' # The error explanation box.
    assert_select 'div.has-error'         # Fields with errors.
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      # NOTE: post_via_redirect arranges to follow the redirect after submission.
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert_not flash.empty?  # The flash is NOT empty.
    assert user_is_logged_in?
  end
end
