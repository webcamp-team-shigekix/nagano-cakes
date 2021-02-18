class Customers::ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

  def index
    @products = Product.all
  end
  
  def create
  end
end
