class ApplicationController < ActionController::Base
	
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :current_cart

  
   def current_cart
    if session[:cart_id]
     
      @current_cart ||= Cart.find(session[:cart_id])
    end

    if session[:cart_id].nil?
      @current_cart = Cart.create!(user_id: current_user.id)
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end 

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type, :email, :password,:first_name, :last_name, :phonenum, :houseno, :shippingaddress, :city, :state, :pincode])
  end
    
end  
