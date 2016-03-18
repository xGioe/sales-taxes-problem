class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cat_name
      t.decimal :tax_fee, precision: 5, scale: 2
      t.boolean :fee_free, default: false

      t.timestamps null: false
    end
  end
end
