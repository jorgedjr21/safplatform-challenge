require_relative '../../lib/cart'
require_relative '../../lib/product'

RSpec.describe Cart do
  let(:product) { Product.new(name: 'music CD', price: 14.99) }
  
  context 'when defining the class' do
    subject(:cart) { Cart.new }

    it { expect(cart.items).to be_empty }
  end

  context '#add_product' do
    subject(:cart) { Cart.new }

    it 'must add a new item to list of cart items' do
      expect { cart.add_product(quantity: 1, product: product) }.to change(cart.items, :count).by(1)
    end

    it 'expect the added item to be equal the product informed' do
      cart.add_product(quantity: 1, product: product)

      expect(cart.items.last[:product]).to eq(product)
    end

    context 'when product is not informed' do
      it 'must raise an argument error' do
        expect { cart.add_product(quantity: 1) }.to raise_error(ArgumentError)
      end
    end
  end

  context 'cart totals' do
    let(:cart) { Cart.new }
    let(:chocolate_bar_product) { Product.new(name: 'chocolate bar', price: 0.85) }

    before do
      cart.add_product(quantity: 1, product: product)
      cart.add_product(quantity: 1, product: chocolate_bar_product)
    end

    context '#calculate_total_without_tax' do
      it 'must have the total value of products without tax' do
        expect(cart.calculate_total_without_tax).to eq(15.84)
      end
    end

    context '#calculate_total_with_tax' do
      it 'must have the total value of products with tax' do
        expect(cart.calculate_total_with_tax).to eq(17.34)
      end
    end

    context '#total_tax' do
      before do
        cart.calculate_total_without_tax
        cart.calculate_total_with_tax
      end

      it 'must have the total value of taxes payed' do
        expect(cart.total_tax).to eq(1.50)
      end
    end
  end
end
