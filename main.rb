require_relative './lib/input_reader'
require_relative './lib/input_processor'
require_relative './lib/output'

inputs = InputReader.new(file_name: 'input.txt').read
cart = InputProcessor.new(inputs: inputs).to_cart

cart.calculate_total_without_tax
cart.calculate_total_with_tax

Output.new(cart: cart).print_formatted
