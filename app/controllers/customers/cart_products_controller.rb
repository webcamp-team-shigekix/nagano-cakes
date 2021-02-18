class Customers::CartProductsController < ApplicationController

  def index
    @cart_product = CartProduct.new
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    # @cart_products = CartProduct.all
    @tax = 1.08
    @total_price = 0
  end

  def create
    cart_product = CartProduct.new(cart_product_params)
    cart_product.customer_id = current_customer.id
    cart_product.save
    redirect_to customers_cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to customers_cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to customers_cart_products_path
  end
  
  def destroy_all
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products.destroy_all
    redirect_to customers_cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:count, :product_id)
  end
end