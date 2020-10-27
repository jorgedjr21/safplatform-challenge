# frozen_string_literal: true

class Output
  def initialize(cart:)
    @cart = cart
  end

  def print_formatted
    @cart.items.each do |cart_item|
      puts "#{cart_item[:quantity]} #{cart_item[:product].name}: #{cart_item[:quantity] * cart_item[:product].taxed_price} \n"
    end

    total_tax = sprintf('%.2f', @cart.total_tax)
    puts "Sales Taxes: #{total_tax}\n"
    puts "Total: #{@cart.total_with_tax}"
  end
end
