class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    @data = Array.new
    @next = data
  end
end
