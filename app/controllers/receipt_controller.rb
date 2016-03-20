class ReceiptController < ApplicationController
  before_action :empty_groceries_list?

  # Calculate total of receipt
  def show_total
    #Get all products
    @prods_list = Product.all
    # Total amount to pay
    @total = 0
    # Total taxes to pay
    @total_taxes = 0

    # Iterates for every product in prods_list
    @prods_list.each do |item|
      @prod_price = item.price
      # Check whether item is imported and applies imported_tax_value
      if item.imported == true
        @prod_price += (item.price * 0.05)
      end

      # Check whether item's category has tax_fee and applies tax_fee_value
      if item.category.fee_free == false
        # Get the item's category_tax_fee
        @prod_category_fee = item.category.tax_fee
        # Calculate tax amount for item price
        @prod_fee = (item.price * (@prod_category_fee/100) )
        # Add category_tax_fee amount to item's price
        @prod_price += @prod_fee
        # Add category_tax_fee amount to item's total taxes
        @total_taxes += @prod_fee
      end
        # Calculate total price for item's quantity
        @prod_price *= item.qnty
        # Add total price of item to final receipt total
        @total += @prod_price
    end
    render 'show'
  end

#   private
#   # Set imported tax and calculate price with imported tax
#   def apply_imported_tax_value
#     @imported_tax_value = 0.05
#
#     if @product.imported == true
#       @product.price *= @imported_tax_value
#     end
# end

private
  # Redirect to new product path if products list is empty
  def empty_groceries_list?
    @list = Product.all
    if @list.empty?
      redirect_to new_product_path
      flash[:danger] = "Please add at least one product first"
    end

  end


end
