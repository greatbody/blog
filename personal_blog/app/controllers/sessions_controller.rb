class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Logged in successfully!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
  
  def failure
    redirect_to root_path, alert: "Authentication failed, please try again."
  end
end
