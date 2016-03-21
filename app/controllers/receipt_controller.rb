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

    @prods_list.each do |item|
      @totals = item.get_taxed_price
      @total += @totals[0]
      @total_taxes += @totals[1]
    end

    @total.round(2)
    @total_taxes.round(2)


    render 'show'
  end

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
