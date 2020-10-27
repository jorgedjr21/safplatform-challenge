# frozen_string_literal: true

require_relative 'tax'

# TODO: specs
# Represents the products in a shopping cart
class Cart
  attr_accessor :cart_items, :total_without_tax, :total_with_tax

  def initialize
    @cart_items = []
  end

  def add_product(quantity:, product:)
    @cart_items << {
      quantity: quantity,
      product: product
    }
  end

  def calculate_total_without_tax
    @total_without_tax = @cart_items.reduce(0) { |total, cart_item| total + (cart_item[:quantity] * cart_item[:product].price) }.round(2)
  end

  def calculate_total_with_tax
    @total_with_tax = @cart_items.reduce(0) { |total, cart_item| total + round_to_nearest(cart_item[:product].taxed_price * cart_item[:quantity]) }
  end

  def total_tax
    @total_with_tax - @total_without_tax
  end

  private

  def round_to_nearest(value)
    ((value * 20) / 20.0).round(2)
  end
end
