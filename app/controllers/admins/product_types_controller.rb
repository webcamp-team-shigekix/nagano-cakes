class Admins::ProductTypesController < ApplicationController

  def index
    @product_type_new = ProductType.new
    @product_types = ProductType.all
  end

  def create
    @product_type = ProductType.new(product_type_params)
    if @product_type.save
      redirect_to admins_product_types_path, notice: "You have created book successfully."
    end
  end

  def edit
    @product_type = ProductType.find(params[:id])
  end

  def update
    @product_type = ProductType.find(params[:id])
    if @product_type.update(product_type_params)
      redirect_to admins_product_types_path, notice: "You have updated book successfully."
    end
  end

  private

  def product_type_params
    params.require(:product_type).permit(:name)
  end

end
