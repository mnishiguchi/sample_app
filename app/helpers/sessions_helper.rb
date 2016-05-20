module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    # Store user id to the temporary session.
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    # Find the user in the database corresponding to the session id by:
    # - hitting the database the first time and cashing it, or
    # - returning the instance variable immediately on subsequent invocations.
    @current_user ||= User.find_by(id: session[:user_id])

    # find vs find_by
    # - find:    raises an exception if the user id doesn’t exist.
    # - find_by: returns nil (indicating no such user) if the id is invalid.
  end

  # Returns true if a user is logged in, else false.
  def logged_in?
    # Call the current_user() method and check if a logged-in user exists.
    ! current_user().nil?
  end

  # Logs out the current user.
  def log_out
    # Logging out involves undoing the effects of the log_in method.
    session.delete(:user_id) # Delete the user id stored in the session.
    @current_user = nil      # Clear the cached current user.
  end
end
