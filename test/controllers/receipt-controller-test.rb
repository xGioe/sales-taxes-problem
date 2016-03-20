require 'test_helper'

class ReceiptControllerTest < ActionController::TestCase

  def setup
  end

  test 'should redirect to new product if list is empty' do
    Product.destroy_all
    get :show_total
    assert_redirected_to new_product_url
  end

end
