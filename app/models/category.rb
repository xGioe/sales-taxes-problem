class Category < ActiveRecord::Base
  has_many :products

  validates :cat_name, presence: true
  validates :fee_free, presence: true
  validates :tax_fee, presence: true, :unless => :fee_free

end
