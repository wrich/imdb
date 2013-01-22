class SessionsController < ApplicationController
  def hi
  end
  
  def introduce
    user = User.find_by_email(params[:email])
    
    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome back, #{user.name}!"
    else
      redirect_to login_url, :notice => "Sorry, try again."
    end
  end

  def bye
    session[:user_id] = nil
    redirect_to root_url
  end
end













