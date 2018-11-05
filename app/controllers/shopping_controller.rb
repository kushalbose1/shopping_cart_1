class ShoppingController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'project'
  def index
  	 @products = Product.all
  end
  
  def show
    @products = Product.where(category_id: params[:id])
  end
end
  

