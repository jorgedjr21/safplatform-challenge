# TODO: specs

class Output
  def initialize(cart:)
    @cart = cart
  end

  def print_formatted
    @cart.cart_items.each do |cart_item|
      puts "#{cart_item[:quantity]} #{cart_item[:product].name} #{cart_item[:product].taxed_price} \n"
    end

    puts "Sales taxes: #{@cart.total_tax}\n"
    puts "Total: #{@cart.total_with_tax}"
  end
end
