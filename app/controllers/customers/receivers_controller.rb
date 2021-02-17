class Customers::ReceiversController < ApplicationController
  def index
    @receivers = Receiver.where(customer_id: current_customer.id)
  end

  def edit
    @receiver = Receiver.find(params[:id])
  end

  def create
    @receiver = Receiver.new(customer_id: current_customer.id, name: "未登録", postal_code: "未登録", address: "未登録")
    if @receiver.save
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @receiver = Receiver.find(params[:id])
    if @receiver.update(receiver_params)
      redirect_to receivers_path
    else
      render :edit
    end
  end

  def destroy
    @receiver = Receiver.find(params[:id])
    if @receiver.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def receiver_params
    params.require(:receiver).permit(:name, :postal_code, :address)
  end

end
