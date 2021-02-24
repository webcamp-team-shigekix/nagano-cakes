class Customers::ReceiversController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @receivers = current_customer.receivers
    @receiver = Receiver.new
  end

  def edit
    @receiver = Receiver.find(params[:id])
  end

  def create
    @receivers = current_customer.receivers
    @receiver = Receiver.new(receiver_params)
    if @receiver.save
      flash[:notice] = "配送先を追加しました"
      redirect_back(fallback_location: root_path)
    else
      render :index
    end
  end

  def update
    @receiver = Receiver.find(params[:id])
    if @receiver.update(receiver_params)
      flash[:notice] = "更新しました"
      redirect_to receivers_path
    else
      render :edit
    end
  end

  def destroy
    @receiver = Receiver.find(params[:id])
    if @receiver.destroy
      flash[:notice] = "削除しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def receiver_params
    params.require(:receiver).permit(:customer_id, :name, :postal_code, :address)
  end

end
