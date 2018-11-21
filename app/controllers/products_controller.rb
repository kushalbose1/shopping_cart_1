class ProductsController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    if current_user.is_admin?
       @products = Product.all
    else
       @products = @current_user.products
    end
  end
  def show
    @product = Product.find_by_id(params[:id])
  end
  def new
    @product = Product.new
  end
  def edit
    @product.user = current_user
    @product = Product.find(params[:id])
  end
  
  def create
    @product = current_user.products.new(product_params)
    @product.image.attach(params[:product][:images])
    if @product.save
      redirect_to  new_product_path, notice: 'Product successfully added.'
    else
      redirect_to new_product_path, notice: "data not inserted"
    end
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to edit_product_path(@product), notice: " updated"
    else
      render 'edit'
    end
  end
  def destroy
    @product.destroy
    respond_to do |format|
    format.html { redirect_to products_url }
    format.json { head :no_content }
    end
  end
  private
  def set_product

    @product = Product.find_by_id(params[:id])
    
  end
  def product_params
    params.require(:product).permit(:product_name, :category_id, :product_price, :product_description, :quantity)
  end
end