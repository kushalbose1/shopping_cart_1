# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 # def create
 #    user = User.where(email: params[:user][:email],  password: params[:user][:password]).first
 #    if user.present?
 #      session[:user_id] = user.id
 #      redirect_to user_path(session[:user_id]), notice:  "Logged in!" 
 #    else
 #      render :new, notice: "User not found"   
 #    end
 #  end 
  # GET /resource/sign_in
  # def new
  #   super
  # end


  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  #   

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end