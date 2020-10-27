# frozen_string_literal: true

require_relative 'tax'

class Product
  attr_accessor :name, :price, :imported, :taxed_price
  ROUND_NUMBER = 0.05

  def initialize(name:, price:, imported: false)
    @name     = name
    @price    = price
    @imported = imported

    set_taxed_price
  end

  private

  def set_taxed_price
    value = (Tax.product_tax(self) * price)
    rounded = value.round(1)
    diff = value - rounded

    @taxed_price = if diff.positive? && diff < 0.05
                     (rounded + ROUND_NUMBER).round(2)
                   else
                     value.round(2)
                   end
  end

  def decimal_places(number)
    return 0 if number.nil?

    number.to_s.split('.').last.length
  end
end
