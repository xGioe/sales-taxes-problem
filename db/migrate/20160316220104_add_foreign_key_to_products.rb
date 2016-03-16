class AddForeignKeyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category_id, :integer
    add_foreign_key :products, :categories
  end
end
