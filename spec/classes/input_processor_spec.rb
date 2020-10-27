require_relative '../../lib/classes/input_processor'

RSpec.describe InputProcessor do
  context 'when defining the class' do
    it 'must raise exception if file_name is not provided' do
      expect { InputProcessor.new }.to raise_error(ArgumentError)
    end
  end

  context '#to_cart' do
    let(:inputs) { ['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85'] }
    subject { InputProcessor.new(inputs: inputs).to_cart }

    it 'must process the input to a cart' do
      expect(subject.cart_items.count).to eq(3)
    end

    it 'must have the products names' do
      names = subject.cart_items.map { |product| product[:product].name }

      expect(names).to eq(['book', 'music CD', 'chocolate bar'])
    end

    it 'must have the products prices' do
      prices = subject.cart_items.map { |product| product[:product].price }

      expect(prices).to eq([12.49, 14.99, 0.85])
    end

    it 'must have the products quantity' do
      quantity = subject.cart_items.map { |product| product[:quantity] }

      expect(quantity).to eq([2, 1, 1])
    end
  end
end
