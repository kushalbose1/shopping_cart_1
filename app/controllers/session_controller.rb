class SessionController < ApplicationController
	before_action :require_none, only: [:new]

   def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      current_cart.user = current_user
      current_cart.save
      redirect_to root_path, :notice => "Welcome back!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end
end
