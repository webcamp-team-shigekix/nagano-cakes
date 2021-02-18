class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @ship_cost = 
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    # カート内商品の種類の数だけ@ordered_productを作ってカラムに値入れて全部save
    @order.save
    @cart_products.destroy_all
    redirect_to orders_finish_path
    
  end

  def finish
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:how_to_pay, :postal_code, :address, :receiver_name)
  end

end
