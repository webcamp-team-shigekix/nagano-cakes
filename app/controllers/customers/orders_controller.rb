class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if @order.how_to_pay == 0
      @way_to_pay = "クレジットカード"
    else
      @way_to_pay = "銀行振込"
    end
    @total_price = 0
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.save
    # カート内商品の種類の数だけ@ordered_productを作ってカラムに値入れて全部save、その後カート内全削除
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products.each do |cart_p|
      @ordered_product = OrderedProduct.new
      @ordered_product.order_id = @order.id
      @ordered_product.product_id = cart_p.product_id
      @ordered_product.count = cart_p.count
      @ordered_product.tax_included_price = cart_p.product.price*1.1
      @ordered_product.save
    end
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
