class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.boolean :imported, default: false
      t.integer :qnty

      t.timestamps null: false
    end
  end
end
