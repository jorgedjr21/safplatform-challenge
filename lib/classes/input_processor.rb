# frozen_string_literal: true

require_relative 'product'
require_relative 'cart'

class InputProcessor
  def initialize(inputs:)
    @inputs = inputs
  end

  def to_cart
    cart = Cart.new

    products_from_input.each do |product|
      cart.add_product(quantity: product[:quantity], product: product[:product])
    end

    cart
  end

  private

  def products_from_input
    products = []
    @inputs.each do |product|
      price    = extract_product_price(product)
      quantity = extract_product_quantity(product)
      imported = product.downcase.include?('imported')

      products << {
        product: Product.new(name: product, price: price, imported: imported),
        quantity: quantity
      }
    end

    products
  end

  def extract_product_price(input)
    price = input.scan(/[0-9]+.[0-9]+/).last.to_f
    input.gsub!(/ at +[0-9]+.[0-9]+/, '')
    price
  end

  def extract_product_quantity(input)
    quantity = input.scan(/[0-9]/).last.to_i
    input.gsub!(/[0-9]+./, '')
    quantity
  end
end
