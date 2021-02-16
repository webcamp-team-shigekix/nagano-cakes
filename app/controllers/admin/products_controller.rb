class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path, notice: "You have created book successfully."
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :product_type_id, :price, :is_active)
  end

end
