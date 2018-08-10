class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = nil # @queue[@queue.length]
  end

  def enqueue(element)
    @tail = element
    @queue[@queue.length] = @tail
    @head = @queue[0]
  end

  def dequeue
    @queue.delete_at(0)
    # @head = @queue[0]
    # @tail = @queue[@queue.length - 1]
  end

  def empty?
    # !@queue ? true : false
    @queue.empty?
  end
end
