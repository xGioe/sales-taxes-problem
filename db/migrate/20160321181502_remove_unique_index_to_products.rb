class RemoveUniqueIndexToProducts < ActiveRecord::Migration
  def change
    remove_index :products, :name
  end
end
