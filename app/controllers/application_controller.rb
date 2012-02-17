class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate!

  helper_method :current_user

  def signed_in?
    !!current_user
  end

  def current_user
    User.where(:id => session[:user_id]).first if session[:user_id]
  end

  def authenticate!
    #session[:user_id] = rand(100)
    redirect_to :sign_in_path unless signed_in?
  end

end
