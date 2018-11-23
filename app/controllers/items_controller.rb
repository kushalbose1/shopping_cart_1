class ItemsController < ApplicationController
  
    def create
      @product = Product.find(params[:product_id])
      @item = Item.create!(:cart => current_cart, :product => @product, :quantity => 1)
      redirect_to cart_path(current_cart.id)
    end
    def destroy
      @item = Item.find(params[:id])
  	  @item.destroy
  	  redirect_to cart_path(@current_cart)
    end  

    private
    def item_params
      params.require(:item).permit(:quantity,:product_id, :cart_id , :amount)
    end
end
