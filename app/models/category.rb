class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates :cat_name, presence: true
  validates :fee_free, inclusion: { in: [true,false] }
  validates :tax_fee, presence: true, if: :has_fee?
  validates :tax_fee, numericality: { greater_than: 0 }, if: :has_fee?

  def has_fee?
    fee_free == false
  end

end
