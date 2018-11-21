class Item < ApplicationRecord
	def create
  # Find associated product and current cart
  chosen_product = Product.find(params[:product_id])
  current_cart = @current_cart

  # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
  if current_cart.products.include?(chosen_product)
    # Find the line_item with the chosen_product
    @item = current_cart.items.find_by(:product_id => chosen_product)
    # Iterate the line_item's quantity by one
    @item.quantity += 1
  else
    @item = Item.new
    @item.cart = current_cart
    @item.product = chosen_product
  end

  # Save and redirect to cart show path
  @.save
  redirect_to cart_path(current_cart)
end
   def destroy
	  @line_item = LineItem.find(params[:id])
	  @line_item.destroy
	  redirect_to cart_path(@current_cart)
   end  

private
  def item_params
    params.require(:item).permit(:quantity,:product_id, :cart_id)
  end
end
