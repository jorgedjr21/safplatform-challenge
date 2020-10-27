require_relative '../../lib/classes/output'
require_relative '../../lib/classes/cart'
require_relative '../../lib/classes/product'

RSpec.describe Output do
  context 'when defining the class' do
    it 'must raise exception if file_name is not provided' do
      expect { Output.new }.to raise_error(ArgumentError)
    end
  end

  context 'statement problem input 1 cart' do
    let(:cart) { Cart.new }
    let(:cart_items) do
      [
        {
          quantity: 2,
          name: 'book',
          price: 12.49
        },
        {
          quantity: 1,
          name: 'music CD',
          price: 14.99
        },
        {
          quantity: 1,
          name: 'chocolate bar',
          price: 0.85
        }
      ]
    end

    subject { Output.new(cart: cart).print_formatted }

    before do
      cart_items.each do |cart_item|
        product = Product.new(name: cart_item[:name], price: cart_item[:price])
        cart.add_product(quantity: cart_item[:quantity], product: product)
      end

      cart.calculate_total_without_tax
      cart.calculate_total_with_tax
    end

    it 'must have the correct output result' do
      expect { subject }.to output("2 book: 24.98 \n1 music CD: 16.49 \n1 chocolate bar: 0.85 \nSales Taxes: 1.50\nTotal: 42.32\n").to_stdout
    end
  end

  context 'statement problem input 2 cart' do
    let(:cart) { Cart.new }
    let(:cart_items) do
      [
        {
          quantity: 1,
          name: 'imported box of chocolates',
          price: 10.0
        },
        {
          quantity: 1,
          name: 'imported bottle of perfume',
          price: 47.50
        }
      ]
    end

    subject { Output.new(cart: cart).print_formatted }

    before do
      cart_items.each do |cart_item|
        product = Product.new(name: cart_item[:name], price: cart_item[:price], imported: true)
        cart.add_product(quantity: cart_item[:quantity], product: product)
      end

      cart.calculate_total_without_tax
      cart.calculate_total_with_tax
    end

    it 'must have the correct output result' do
      expect { subject }.to output("1 imported box of chocolates: 10.5 \n1 imported bottle of perfume: 54.65 \nSales Taxes: 7.65\nTotal: 65.15\n").to_stdout
    end
  end

  context 'statement problem input 3 cart' do
    let(:cart) { Cart.new }
    let(:cart_items) do
      [
        {
          quantity: 1,
          name: 'imported bottle of perfume',
          imported: true,
          price: 27.99
        },
        {
          quantity: 1,
          name: 'bottle of perfume',
          imported: false,
          price: 18.99
        },
        {
          quantity: 1,
          name: 'packet of headache pills',
          imported: false,
          price: 9.75
        },
        {
          quantity: 3,
          name: 'imported boxes of chocolates',
          imported: true,
          price: 11.25
        }
      ]
    end

    subject { Output.new(cart: cart).print_formatted }

    before do
      cart_items.each do |cart_item|
        product = Product.new(name: cart_item[:name], price: cart_item[:price], imported: cart_item[:imported])
        cart.add_product(quantity: cart_item[:quantity], product: product)
      end

      cart.calculate_total_without_tax
      cart.calculate_total_with_tax
    end

    it 'must have the correct output result' do
      expect { subject }.to output("1 imported bottle of perfume: 32.19 \n1 bottle of perfume: 20.89 \n1 packet of headache pills: 9.75 \n3 imported boxes of chocolates: 35.55 \nSales Taxes: 7.90\nTotal: 98.38\n").to_stdout
    end
  end
end
