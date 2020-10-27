require_relative '../../lib/classes/tax'
require_relative '../../lib/classes/product'

RSpec.describe Tax do
  context '#product_tax' do
    context 'with no product' do
      it 'must be 0.0' do
        expect(Tax.product_tax(nil)).to eq(0.0)
      end
    end

    context 'imported' do
      it 'box of chocolates must be 1.05 (5% import tax)' do
        product = Product.new(name: 'imported box of chocolates', price: 10.0, imported: true)

        expect(Tax.product_tax(product)).to eq(1.05)
      end

      it 'bottle of perfume must be 1.15 (10% base tax and 5% import tax)' do
        product = Product.new(name: 'imported bottle of perfume', price: 10.0, imported: true)

        expect(Tax.product_tax(product)).to eq(1.15)
      end
    end

    context 'not imported' do
      it 'chocolate bar must be 1.00 (no import and base tax)' do
        product = Product.new(name: 'chocolate bar', price: 10.0, imported: false)

        expect(Tax.product_tax(product)).to eq(1.00)
      end

      it 'book must be 1.00 (no import and base tax)' do
        product = Product.new(name: 'book', price: 10.0, imported: false)

        expect(Tax.product_tax(product)).to eq(1.00)
      end

      it 'packet of headache pills pills must be 1.00 (no import and base tax)' do
        product = Product.new(name: 'packet of headache pills', price: 10.0, imported: false)

        expect(Tax.product_tax(product)).to eq(1.00)
      end

      it 'bottle of perfume must be 1.10 (10% base tax)' do
        product = Product.new(name: 'bottle of perfume', price: 10.0, imported: false)

        expect(Tax.product_tax(product)).to eq(1.10)
      end

      it 'music CD must be 1.10 (10% base tax)' do
        product = Product.new(name: 'music CD', price: 10.0, imported: false)

        expect(Tax.product_tax(product)).to eq(1.10)
      end
    end
  end
end
