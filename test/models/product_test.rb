require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(cat_name: 'food', fee_free: true)
    @product = Product.new(name: 'banana', price: '10.0', imported: false, category: @category, qnty: 1)
  end

  test 'should be valid' do
    assert_not @product.valid?
  end

end
