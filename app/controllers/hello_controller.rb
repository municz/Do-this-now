class HelloController < ApplicationController

  skip_before_filter :authenticate!
  
  def login
  
    #try to authenticate
    user = User.where(:email => params[:email], :password => params[:password]).first
    
    if user 
      session[:user_id] = user.id
    else
      redirect_to :sign_in_path, :notice => "Incorrect credentials!"
    end  
      
  end

end
