class Admins::ProductTypesController < ApplicationController

  def index
    @product_types = ProductType.all
  end

  def create
    @product_type = ProductType.new(product_type_params)
    @product_type.save
    redirect_to admins_product_types_path, notice: "You have created book successfully."
  end

  def edit
  end

  def update
  end

end
