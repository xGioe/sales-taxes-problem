class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness:  { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :imported, inclusion: { in: [true, false] }
  validates :category_id, presence: true
  validates :qnty, presence: true, numericality: { greater_than: 0, only_integer: true }
  # validates_associated :category

  validate :validate_cat_id

  private

  def validate_cat_id
    errors.add(:cat_id, "is invalid") unless Category.exists?(self.category_id)
  end

end
