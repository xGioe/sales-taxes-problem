require 'test_helper'

class ReceiptIntegrationTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:cat_not_with_fee)
  end

  test 'total for product without fees should not increment' do
    get new_product_path
    assert_template 'products/new'

    assert_difference ('Products.count') do
      post_via_redirect products_path, product: { name: 'playstation',
                                                  price: 12.50, imported: false,
                                                  category_id: @category.id,
                                                  qnty: 2 }
    end

    assert_template 'products/index'
    get total_path
    follow_get
    assert_template 'receipt/show'

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
