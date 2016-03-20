class AddTaxedPriceToProducts < ActiveRecord::Migration
  def change
    add_column :categories, :taxed_price, :decimal, precision: 5, scale: 2
  end
end
