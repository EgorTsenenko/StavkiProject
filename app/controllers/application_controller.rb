class ApplicationController < ActionController::Base

  before_action :current_user

  def authorise_user
    redirect_to auth_path unless @current_user
  end


  def render_not_found
     render file: "#{Rails.root}/public/404.html",
                  layout: true,
                  status: :not_found
  end
  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id].present?
  end



  def user_signed_in?
    current_user.present?
  end
   helper_method :current_user,:user_signed_in?
end
