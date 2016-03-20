require 'test_helper'

class ReceiptIntegrationTest < ActionDispatch::IntegrationTest

  test 'total for product without fees should not increment' do
    get new_product_path
    assert_template 'products/new'
    post products_path, product: products(:product_without_fees)

  end

  # test 'total for product with imported fees should increment' do
  #
  # end
  #
  # test 'total for product with category fees should increment' do
  #
  # end
  #
  # test 'total for product with both fees should increment' do
  #
  # end

end
