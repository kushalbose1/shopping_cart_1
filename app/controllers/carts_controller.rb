class CartsController < ApplicationController
	layout 'project'
	def index
		@cart = Cart.all
	end
    def show
      respond_to do |format|
        if @cart = current_cart
           format.html do
             redirect_to carts_path(current_cart.id)  
           
           end
           format.json { render json: @reservation.to_json }
        else
           format.html { render 'new'} # Specify the format in which you are rendering "new" page
           format.json { render json: @reservation.errors } ## You might want to specify a json format as well
        end
      end  
    end
    def add_to_cart
      
      current_cart.add_product(params[:product_id])
      redirect_to carts_path(current_cart.id),notice: 'Added to cart.'
    end
end
