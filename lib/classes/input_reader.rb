# frozen_string_literal: true

# Read the input file and return the inputs
class InputReader
  def initialize(file_name:)
    @file_name = file_name
  end

  def read
    File.open(@file_name).readlines.map(&:chomp)
  end
end
