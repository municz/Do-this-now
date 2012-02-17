class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate!

  helper_method :current_user, :is_admin?

  def signed_in?
   !!current_user
  end

  def current_user
    @current_user ||= User.where(:id => session[:user_id]).first if session[:user_id]
  end
  
  def is_admin?
    session[:user_is_admin] == 1
  end

  def authenticate!
    redirect_to :sign_in_path unless signed_in?
  end
  
  def authorize_admin!
    redirect_to :sign_in_path unless is_admin?
  end

end
