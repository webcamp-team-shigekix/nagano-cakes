class Admins::OrdersController < ApplicationController
  def index
    if params[:check] == "0"
      @orders = Order.all
    elsif params[:check] && (params[:check] != "0")
      @orders = Order.where(customer_id: params[:check])
      @notice = "一名様の注文履歴のみ表示しています。全ての会員の履歴はページ上部のリンクからご覧ください。"
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = OrderedProduct.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_back(fallback_location: root_path)
    else
      render :show
    end

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
