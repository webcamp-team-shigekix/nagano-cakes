class Customers::ProductsSearchController < ApplicationController

  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @value).where(is_active: true).page(params[:page]).per(8)
    @product_type = ProductType.find_by(id: params["search"]["value"])
  end

  private

  def match(value)
    Product.where(product_type_id: value)
  end

  def search_for(how, value)
    case how
    when 'match'
      match(value)
    end
  end

end
