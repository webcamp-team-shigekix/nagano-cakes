class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    if CartProduct.where(customer_id: current_customer.id).count == 0
      flash[:notice] = "カートは空です"
      redirect_back(fallback_location: root_path)
    end
  end

  def confirm
    if params[:way_to_pay]
    else
      redirect_to new_orders_path
    end
    @order = Order.new
    case params[:way_to_pay]
    when "0"
      @way_to_pay = "クレジットカード"
    when "1"
      @way_to_pay = "銀行振込"
    end

    case params[:select]
    when "0"
      @p_code = params[:postal_code0]
      @address = params[:address0]
      @name = params[:receiver_name0]
    when "1"
      receiver = Receiver.find_by(postal_code: params[:info1])
      @p_code = receiver.postal_code
      @address = receiver.address
      @name = receiver.name
    when "2"
      @p_code = params[:postal_code2]
      @address = params[:address2]
      @name = params[:receiver_name2]
    end

    @total_price = 0
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = $ship
    if @order.save
      # カート内商品の種類の数だけ@ordered_productを作ってカラムに値入れて全部save、その後カート内全削除
      @cart_products = CartProduct.where(customer_id: current_customer.id)
      @cart_products.each do |cart_p|
        @ordered_product = OrderedProduct.new
        @ordered_product.order_id = @order.id
        @ordered_product.product_id = cart_p.product_id
        @ordered_product.count = cart_p.count
        @ordered_product.tax_included_price = cart_p.product.price*$tax
        @ordered_product.save
      end
      @cart_products.destroy_all
      redirect_to orders_finish_path
    else
      flash[:notice] = "注文を確定できませんでした"
      redirect_to new_orders_path
    end

  end

  def finish
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = OrderedProduct.where(order_id: @order.id)
  end

  def redirect
    redirect_to new_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:how_to_pay, :postal_code, :address, :receiver_name, :total_payment)
  end

end
