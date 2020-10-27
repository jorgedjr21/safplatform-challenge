# frozen_string_literal: true

class Tax
  BASE_TAX   = 0.10
  IMPORT_TAX = 0.05
  PRODUCTS_FREE_BASE_TAX = %w[book chocolate pills].freeze

  class << self
    def product_tax(product)
      return 0 if product.nil? || product == ''

      tax = product.imported ? IMPORT_TAX : 0.0

      if free_tax_product?(product: product)
        (1 + tax).round(2)
      else
        (1 + tax + BASE_TAX).round(2)
      end
    end

    private

    def free_tax_product?(product:)
      PRODUCTS_FREE_BASE_TAX.each do |free_product|
        return true if product.name.include?(free_product)
      end

      false
    end
  end
end
