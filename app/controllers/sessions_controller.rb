class SessionsController < ApplicationController

  # GET login
  # The login form.
  def new
  end

  # POST login
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in @user
      remember_or_forget
      redirect_to @user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    # Remembers user for persistent session if the checkbox is checked.
    def remember_or_forget
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
    end
end
