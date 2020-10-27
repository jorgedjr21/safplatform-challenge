# frozen_string_literal: true

class Output
  def initialize(cart:)
    @cart = cart
  end

  def print_formatted
    @cart.items.each do |cart_item|
      puts "#{cart_item[:quantity]} #{cart_item[:product].name}: #{total_item_price(cart_item)} \n"
    end

    total_tax = sprintf('%.2f', @cart.total_tax)
    puts "Sales Taxes: #{total_tax}\n"
    puts "Total: #{@cart.total_with_tax.round(2)}"
  end

  private

  def total_item_price(cart_item)
    total = (cart_item[:quantity] * cart_item[:product].taxed_price).round(2)
    sprintf('%.2f', total)
  end
end
