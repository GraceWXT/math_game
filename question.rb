class Question
  attr_reader :value1, :value2
  def initialize
    @value1 = Random.new.rand(1..20)
    @value2 = Random.new.rand(1..20)
  end

  def correct?(input)
    input == value1 + value2
  end
end
