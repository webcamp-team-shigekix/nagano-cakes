class Customers::CartProductsController < ApplicationController
  
  def index
    @cart_prodct = CartProduct.new
    @cart_prodcts = current_customer.cart_prodct.all
  end
  
  def create
    cart_prodct = CartProduct.new(cart_prodct_params)
    cart_prodct.customer = current_customer
    cart_prodct.save
    redirect_to customers_cart_prodcts_path
  end
  
  def destroy
    @cart_prodct = CartProduct.find_by(params[:product_id])
    @cart_prodct.destroy
    redirect_to customers_cart_prodcts_path
  end
  
  private
  
  def cart_prodct_params
    params.require(:cart_prodct).permit(:count, :product_id)
  end
end