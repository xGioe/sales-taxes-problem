require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(cat_name: 'games', tax_fee: 10.0, fee_free: false )
  end

  test 'cat_name should be present' do
    @category.cat_name = "   "
    assert_not @category.valid?
  end

  test 'fee_free should be specified' do
    @category.fee_free = nil
    assert_not @category.valid?
  end

  # test 'tax_fee should not be specified if fee_free' do
  #   assert @category.tax_fee.nil?
  # end
  #
  # test 'tax_fee should be specified if not fee_free' do
  #   assert_not @category.tax_fee.nil?
  # end

end
