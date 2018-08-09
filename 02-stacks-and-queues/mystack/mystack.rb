class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    self.top = item
    @stack[0] = self.top
  end

  def pop
    temp = self.top
    @stack.delete_at(@stack.length - 1)
    self.top = @stack[@stack.length - 1]
    return temp
  end

  def empty?
    !@stack[0] ? true : false
  end
end
