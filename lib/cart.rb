# frozen_string_literal: true

# TODO: specs
# Represents the products in a shopping cart
class Cart
  attr_accessor :items, :total_without_tax, :total_with_tax
  NEAREST_BASE_TO_005 = 20.0

  def initialize
    @items = []
  end

  def add_product(quantity: 0, product:)
    raise ArgumentError if product.nil?

    @items << {
      quantity: quantity,
      product: product
    }
  end

  def calculate_total_without_tax
    @total_without_tax = @items.reduce(0) { |total, cart_item| total + (cart_item[:quantity] * cart_item[:product].price) }.round(2)
  end

  def calculate_total_with_tax
    @total_with_tax = @items.reduce(0) { |total, cart_item| total + round_to_nearest(cart_item[:product].taxed_price * cart_item[:quantity]) }
  end

  def total_tax
    @total_with_tax - @total_without_tax
  end

  private

  def round_to_nearest(value)
    ((value * NEAREST_BASE_TO_005.to_i) / NEAREST_BASE_TO_005).round(2)
  end
end
