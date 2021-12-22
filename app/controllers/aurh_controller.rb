class UsersController < ApplicationController
  #  http_basic_authenticate_with name: "admin", password: "123", except: [:index, :show]

  def create
    @user = User.find_by_email(user_params[:email])
    return redirect_to auth_path,alert: 'Wrong credentials' unless @user
    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirected_to feed_path
    else
      redirected_to auth_path,alert: @user.errors.full_messages.join
    end
  end
  def destroy

  end
  private def user_params
    params.require(:user).permit(:email, :password)
  end



end
