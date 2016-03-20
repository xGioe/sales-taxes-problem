require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @cat_with_fee = categories(:cat_with_fee)
    @cat_not_with_fee = categories(:cat_not_with_fee)
  end

  test 'is valid' do
    assert @cat_with_fee.valid?
    assert @cat_not_with_fee.valid?
  end

  test 'cat_name should be present' do
    @cat_with_fee.cat_name = "   "
    assert_not @cat_with_fee.valid?
  end

  test 'fee_free should be specified' do
    @cat_with_fee.fee_free = nil
    assert_not @cat_with_fee.valid?
  end

  test 'tax_fee should not be specified if not_with_fee' do
    @cat_not_with_fee.tax_fee = 24
    assert_not @cat_not_with_fee.valid?
  end

  test 'tax_fee should be specified if with_fee' do
    @cat_with_fee.tax_fee = nil
    assert_not @cat_with_fee.valid?
  end

  test 'tax_fee should be integer only' do
    @cat_with_fee.tax_fee = 3.5
    assert_not @cat_with_fee.valid?
  end

end
