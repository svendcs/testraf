class Test 
  def initialize(input, expected)
    @input = input
    @expected = expected
  end

  def compare_output(output)
    output.strip == @expected.strip
  end
end