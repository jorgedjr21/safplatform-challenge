require_relative '../../classes/input_reader'

RSpec.describe InputReader do
  context 'when defining the class' do
    it 'must raise exception if file_name is not provided' do
      expect { InputReader.new }.to raise_error(ArgumentError)
    end
  end

  context 'when read the input file' do
    subject { InputReader.new(file_name: 'spec/input_mock.txt').read }
    it 'must have a array of inputs' do
      expect(subject).to eq(%w[testing testing2])
    end
  end
end
