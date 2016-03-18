class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :imported, inclusion: { in: [true, false] }
  validates :category_id, presence: true
  validates :qnty, presence: true, numericality: { greater_than: 0 }

end
