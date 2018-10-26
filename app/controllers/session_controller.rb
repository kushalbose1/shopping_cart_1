class SessionController < ApplicationController
	before_action :require_none, only: [:new]

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to '/login'
    end 
  end

  def destroy      
    session[:user_id] = nil     
    redirect_to '/' 
  end  

end
