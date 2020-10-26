class Tax
  BASE_TAX   = 0.10
  IMPORT_TAX = 0.05
  PRODUCTS_FREE_BASE_TAX = %w[book chocolate\ bar packet\ of\ headache\ pills imported\ boxes\ of\ chocolates].freeze
  
  class << self
    def product_tax(product)
      return 0 if product.nil? || product == ''

      tax = product.imported ? IMPORT_TAX : 0.0

      if PRODUCTS_FREE_BASE_TAX.include?(product.name)
        (1 + tax).round(2)
      else
        (1 + tax + BASE_TAX).round(2)
      end
    end
  end
end
