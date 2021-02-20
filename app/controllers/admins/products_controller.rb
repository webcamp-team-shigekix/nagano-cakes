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
      flash[:notice] = "商品を登録しました"
      redirect_to admins_product_path(@product)
    else
      flash[:notice] = "必要な項目が未入力です"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品情報を変更しました"
      redirect_to admins_product_path(@product)
    else
      flash[:notice] = "必要な項目が未入力です"
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :product_type_id, :price, :is_active)
  end

end
