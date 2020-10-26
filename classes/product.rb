class Product
  attr_accessor :name, :price, :imported

  def initialize(name:, price:, imported: false)
    @name     = name
    @price    = price
    @imported = imported
  end
end
