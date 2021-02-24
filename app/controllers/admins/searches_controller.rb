class Admins::SearchesController < ApplicationController
  def search
    content = params[:content]
    model = params[:model]
    if model == "Customer"
      @customers = Customer.where("email LIKE ?", "%#{content}%")\
        .or(Customer.where(" family_name||first_name LIKE ?", "%#{content}%"))\
        .or(Customer.where(" family_name_kana||first_name_kana LIKE ?", "%#{content}%"))\
        .page(params[:page]).per(10)
      render 'admins/customers/index'
    else
      @products = Product.where("name LIKE ?", "%#{content}%").page(params[:page]).per(10)
      render 'admins/products/index'
    end
  end
end