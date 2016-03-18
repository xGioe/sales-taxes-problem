class RemoveTaxfeeToCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :taxfee
  end
end
