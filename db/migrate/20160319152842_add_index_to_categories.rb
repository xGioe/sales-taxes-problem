class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, :cat_name, unique: true
    add_index :products, :name, unique: true
  end
end
