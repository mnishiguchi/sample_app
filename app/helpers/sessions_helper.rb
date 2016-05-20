module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    # Store user id to the temporary session.
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.persist
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    # Find the user in the database corresponding to the session id by:
    # - hitting the database the first time and cashing it, or
    # - returning the instance variable immediately on subsequent invocations.
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])

    # In case the session is nil, check the existence of cookies.
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticate_token(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end

    # find vs find_by
    # - find:    raises an exception if the user id doesn’t exist.
    # - find_by: returns nil (indicating no such user) if the id is invalid.
  end

  # Returns true if a user is logged in, else false.
  def logged_in?
    # Call the `current_user()` method and check if a logged-in user exists.
    ! current_user().nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.unpersist                  # In the database
    cookies.delete(:user_id)        # In the browser
    cookies.delete(:remember_token) # In the browser
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    # Logging out involves undoing the effects of the log_in method.
    session.delete(:user_id) # Delete the user id stored in the session.
    @current_user = nil      # Clear the cached current user.
  end
end
