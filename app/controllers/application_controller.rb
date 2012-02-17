class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate!

  helper_method :current_user

  def signed_in?
    true
  end

  def current_user
    session[:user_id]
  end

  def authenticate!
    #session[:user_id] = rand(100)
    redirect_to users_path unless signed_in?
  end

end
