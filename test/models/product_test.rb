require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @category = categories(:cat_with_fee)
    @product = Product.new(name: 'banana', price: '10.0', imported: false, category_id: @category.id, qnty: 1)
  end

  test 'name should be present' do
    @product.name = "   "
    assert_not @product.valid?
  end

  test 'name should not have less than three characters' do
    @product.name = "a" * 2
    assert_not @product.valid?
  end

  test 'price should be at least zero' do
    @product.price = -3
    assert_not @product.valid?
  end

  test 'imported should be specified' do
    @product.imported = nil
    assert_not @product.valid?
  end

  test 'valid category_id should be present' do
    @product.category_id = nil
    assert_not @product.valid?
  end

  test 'qnty should be atleast 1' do
    @product.qnty = 0
    assert_not @product.valid?
  end

  test 'qnty should be an integer' do
    @product.qnty = 'string'
    assert_not @product.valid?
  end

end
