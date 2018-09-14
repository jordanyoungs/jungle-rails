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
      flash[:info] = "Welcome " + user.first_name + "!"
      redirect_to :root
    elsif !user
      flash.now[:danger] = "Email not registered"
      render :new
    else
      flash.now[:danger] = "Invalid password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Successfully logged out"
    redirect_to :login
  end

  private

  def login_params
    params.require(:login).permit(:email, :password, :password_confirmation)
  end

end
