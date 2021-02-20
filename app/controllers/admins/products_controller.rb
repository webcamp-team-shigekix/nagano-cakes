class Admins::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product), notice: "You have created book successfully."
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_product_path(@product), notice: "You have updated product successfully"
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :product_type_id, :price, :is_active)
  end

end
