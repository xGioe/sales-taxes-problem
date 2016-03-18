class AddTaxFeeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :tax_fee, :decimal, precision: 5, scale: 2, default: 0.0
  end
end
