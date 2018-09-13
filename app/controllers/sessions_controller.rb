class SessionsController < ApplicationController

  def new
    @email = ''
  end

  def create
    @email = login_params[:email]
    user = User.find_by_email(login_params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(login_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      flash[:info] = "You logged in!"
      flash[:success] = "You logged in!"
      flash[:danger] = "You logged in!"
      flash[:warning] = "You logged in!"
      redirect_to :root
    else
    # If user's login doesn't work, send them back to the login form.
      flash.now[:danger] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end

  private

  def login_params
    params.require(:login).permit(:email, :password, :password_confirmation)
  end

end
