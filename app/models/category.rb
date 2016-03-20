class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates :cat_name, presence: true
  validates :cat_name, uniqueness:  {case_sensitive: false}
  validates :fee_free, inclusion: { in: [true,false] }
  validates :tax_fee, presence: true, if: :has_fee?
  validates :tax_fee, numericality: { greater_than: 0, only_integer: true }, if: :has_fee?
  validates :tax_fee, no_presence: true, if: :has_not_fee?

  def has_fee?
    fee_free == false
  end

  def has_not_fee?
    fee_free == true
  end

end
