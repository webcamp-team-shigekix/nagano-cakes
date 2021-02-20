require 'test_helper'

class Customers::ProductsSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get customers_products_search_search_url
    assert_response :success
  end

end
