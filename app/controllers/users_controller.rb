class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id

      redirect_to home_path
    else
      render :new, alert: @user.errors.full_messages.join
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:name,:password,:password_confirmation)
  end
end