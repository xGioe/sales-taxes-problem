class ChangeTaxFeeTypeInCategories < ActiveRecord::Migration
  def up
      change_column :categories, :tax_fee, :integer
    end

    def down
      change_column :categories, :tax_fee, :decimal, precision: 5, scale: 2
    end
end
