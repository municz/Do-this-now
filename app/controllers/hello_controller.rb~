class HelloController < ApplicationController

  skip_before_filter :authenticate!
  
  def login
  
    user = User.where(:email => params[:email], :password => params[:password]).first
    
    if user 
      session[:user_id] = user.id 
      session[:user_is_admin] = user.is_admin
      redirect_to :sign_in_path
    else
      flash[:error] = "Incorrect credentials!"
      redirect_to :sign_in_path
    end  
      
  end
  
  def logout
  
    session[:user_id] = nil
    session[:user_is_admin] = nil
    redirect_to :sign_in_path
  
  end

end
