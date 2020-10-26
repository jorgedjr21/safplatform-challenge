require_relative '../../classes/product'

RSpec.describe Product do
  context 'when defining the class' do
    context 'with correct attributes' do
      subject { Product.new(name: 'test', price: 10.0, imported: true) }

      it 'should have a defined name' do
        expect(subject.name).to eq('test')
      end

      it 'should have a defined price' do
        expect(subject.price).to eq(10.0)
      end

      it 'should have a defined imported' do
        expect(subject.imported).to be_truthy
      end

      it 'should have a defined taxed price' do
        expect(subject.taxed_price).to eq(11.5)
      end
    end

    context 'without attributes' do
      subject { Product.new }

      it 'should raise an error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
