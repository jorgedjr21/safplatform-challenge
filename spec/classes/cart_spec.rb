require_relative '../../classes/cart'
require_relative '../../classes/product'

RSpec.describe Cart do
  let(:product) { Product.new(name: 'music CD', price: 14.99) }
  context 'when defining the class' do
    subject { Cart.new }

    it 'must have a empty list o cart_items' do
      expect(subject.cart_items).to eq([])
    end
  end

  context '#add_product' do
    subject { cart.add_product(quantity: 1, product: product) }

    let(:cart) { Cart.new }

    it 'must add a new item to list of cart items' do
      expect { subject }.to change(cart.cart_items, :count).by(1)
    end

    it 'expect the added item to be equal the product informed' do
      subject
      expect(cart.cart_items.last[:product]).to eq(product)
    end
  end

  context 'cart totals' do
    let(:cart) { Cart.new }
    let(:product_2) { Product.new(name: 'chocolate bar', price: 0.85) }

    before do
      cart.add_product(quantity: 1, product: product)
      cart.add_product(quantity: 1, product: product_2)
    end

    context '#calculate_total_without_tax' do
      subject { cart.calculate_total_without_tax }

      it 'must have the total value of products without tax' do
        expect(subject).to eq(15.84)
      end
    end

    context '#calculate_total_with_tax' do
      subject { cart.calculate_total_with_tax }

      it 'must have the total value of products with tax' do
        expect(subject).to eq(17.34)
      end
    end

    context '#total_tax' do
      subject { cart.total_tax }

      before do
        cart.calculate_total_without_tax
        cart.calculate_total_with_tax
      end

      it 'must have the total value of taxes payed' do
        expect(subject).to eq(1.50)
      end
    end
  end
end
