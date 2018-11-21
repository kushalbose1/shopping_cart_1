class OrdersController < ApplicationController

  
  layout 'project'
  def index
    @orders = Order.all
   respond_to do |format|
    if @orders =Order.all
       format.html do
        redirect_to '/'
      end
      format.json { render json: @reservation.to_json }
    else
      format.html { render 'new'} ## Specify the format in which you are rendering "new" page
      format.json { render json: @reservation.errors } ## You might want to specify a json format as well
    end
  end
  end
  
                                          
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @cart = @current_cart
  end

  def create
    @order = Order.new(order_params)
    @order.update(user_id: @current_user.id)
    add_line_items_to_order
    @order.save!
    reset_sessions_cart
    redirect_to orders_path
  
  end

 

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path }
      format.json { head :no_content }
      flash[:info] = 'Order was successfully destroyed.'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to orders_path
  end

  def cart_is_empty
    return unless @current_cart.line_items.empty?

    store_location
    flash[:danger] = 'You cart is empty!'
    redirect_to cart_path(@current_cart)
  end

  private

  def add_line_items_to_order
    @current_cart.line_items.each do |item|
      item.cart_id = nil
      item.order_id = @order.id
      item.save
      @order.line_items << item
    end
  end

  def reset_sessions_cart
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end

  def order_params
    params.require(:order).permit(:user_id, :pay_method, :description)
  end
end
