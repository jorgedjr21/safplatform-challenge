require_relative 'tax'

class Product
  attr_accessor :name, :price, :imported, :taxed_price

  def initialize(name:, price:, imported: false)
    @name     = name
    @price    = price
    @imported = imported

    set_taxed_price
  end

  private

  def set_taxed_price
    value = Tax.product_tax(self) * price
    @taxed_price = ((value * 20).round(4) / 20.0).round(2)
  end
end
