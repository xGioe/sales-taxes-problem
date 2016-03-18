class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true
  validates :imported, presence: true
  validates :category, presence: true

end
