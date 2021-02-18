require 'test_helper'

class Customers::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_cart_products_index_url
    assert_response :success
  end

end
