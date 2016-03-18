class AddQntyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :qnty, :integer
  end
end
