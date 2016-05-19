ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Make ApplicationHelper available in the tests.
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...

  # Returns true if a test user is logged in.
  def user_is_logged_in?
    # Because helper methods are not available in tests, 
    # we can’t use the `current_user` method,
    # but the `session` method is available.
    ! session[:user_id].nil?
  end

end
