ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Get the default Rails tests to show red and green at the appropriate times
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Make ApplicationHelper available in the tests.
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...

  # Returns true if a test user is logged in.
  def user_logged_in?
    # Because helper methods are not available in tests,
    # we can’t use the `current_user` method,
    # but the `session` method is available.
    ! session[:user_id].nil?
  end

  # Logs in a test user (2 ways depending on the type of test)
  # Detects the kind of test being used (integration test or not)
  def log_in_as(user, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'

    if integration_test?
      # We don't have access to session variables.
      post login_path, session: { email:       user.email,
                                  password:    password,
                                  remember_me: remember_me }
    else
      # Manipulate the session method directly.
      session[:user_id] = user.id
    end
  end

  private

    # Return true if inside an integration test, else false.
    def integration_test?
      # The post_via_redirect method is available only in integration tests.
      defined?(post_via_redirect)
    end
end
