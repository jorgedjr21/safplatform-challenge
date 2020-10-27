require_relative '../../lib/input_reader'

RSpec.describe InputReader do
  context 'when defining the class' do
    it 'must raise exception if file_name is not provided' do
      expect { InputReader.new }.to raise_error(ArgumentError)
    end
  end

  context '#read' do
    context 'when file exists' do
      subject(:input_reader) { InputReader.new(file_name: 'spec/input_mock.txt').read }

      it 'must have a array of inputs' do
        expect(input_reader).to match_array(%w[testing testing2])
      end
    end

    context 'when file doesn\'t exist' do
      subject(:input_reader) { InputReader.new(file_name: 'spec/input.txt').read }

      it 'must raise a error' do
        expect { input_reader }.to raise_error(Errno::ENOENT)
      end
    end
  end
end
