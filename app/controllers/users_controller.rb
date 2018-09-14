class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account created!"
      redirect_to :root
    else
      @user.errors.full_messages.each do |msg|
        flash.now[:danger] ||= []
        flash.now[:danger] << msg
      end
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      )
  end

end
