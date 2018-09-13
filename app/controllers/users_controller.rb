class UsersController < ApplicationController

  def new
    # @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now.notice = "success!"
    end
    redirect_to '/signup'
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
