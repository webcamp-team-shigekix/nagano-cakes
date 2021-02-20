class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

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
      if @order.order_status == 1
        OrderedProduct.where(order_id: @order.id).each do |prod|
          prod.update(production_status: 1)
        end
        flash[:notice] = "注文ステータスが「入金確認」となったため、制作ステージが「制作待ち」に自動更新されました"
      else
        flash[:notice] = "注文ステータスを変更しました"
      end
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "注文ステータスを変更できませんでした"
      render :show
    end

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
