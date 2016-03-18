class RemoveTaxFeeFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :tax_fee
  end
end
