require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    category_id = 1
    @product = Product.new(name: 'banana', price: '10.0', imported: false, category_id: category_id, qnty: 1)
  end

  test 'should be valid' do
    assert @product.valid?
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

  test 'category_id should be present' do
    @product.category_id = nil
    assert_not @product.valid?
  end

  test 'qnty should be atleast 1' do
    @product.qnty = 0
    assert_not @product.valid?
  end



end
