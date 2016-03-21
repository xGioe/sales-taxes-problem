class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness:  { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :imported, inclusion: { in: [true, false] }
  validates :category_id, presence: true
  validates :qnty, presence: true, numericality: { greater_than: 0, only_integer: true }

  validate :validate_cat_id


  # Get produt's taxed price and tax value applied to it
  def get_taxed_price

    @imported_tax = 0.05

    @taxed_price = 0
    @taxes_total = 0

    @prod_price = self.price
    @taxes_percentage = 0

    if self.imported == true
      @taxes_percentage += @imported_tax
    end

    if self.category.fee_free == false
      @taxes_percentage += ( self.category.tax_fee * 0.01 )
    end

    #rounded_value = (raw_value * 20).round / 20.0

    @taxes = ( (self.price * @taxes_percentage) * 20).ceil * 0.05
    @taxed_price = self.price + @taxes
    # @result = self.price
    # @taxes = 0
    # if self.imported == true
    #   @imported_tax = self.price * 0.05
    #   @taxes += @imported_tax
    #   @result += @imported_tax
    # end
    #
    # if self.category.fee_free == false
    #   @cat_fee = self.price * (self.category.tax_fee * 0.01)
    #   @taxes += @cat_fee
    #   @result += @cat_fee
    # end

    return @taxed_price, @taxes

  end

  private

  def validate_cat_id
    errors.add(:cat_id, "is invalid") unless Category.exists?(self.category_id)
  end

end
