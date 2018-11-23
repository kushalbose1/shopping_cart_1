class OdersController < ApplicationController
	layout 'project'
  def index
    @oders = Oder.all
  end

  def show
    @oder = Oder.find(params[:id])
  end

  def new
    @oder = Oder.new
  end
  def create
	@oder = Oder.new(oder_params)
	@current_cart.items.each do |item|
	  @oder.items << item
	  item.cart_id = nil
    end
	  @oder.save
	  Cart.destroy(session[:cart_id])
	  session[:cart_id] = nil
	  redirect_to root_path
  end

private
  def oder_params
    params.require(:oder).permit(:name, :email, :address, :pay_method)
  end
end
