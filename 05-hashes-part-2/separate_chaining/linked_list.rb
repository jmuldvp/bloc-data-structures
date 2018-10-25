require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = head
    @tail = tail
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
    end
    if !@tail.nil?
      @tail.next = node
    end
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == nil
      @tail = nil
    elsif @head == @tail
      return @tail = nil
    else
      temp = @head
      previousToLast = nil
      until temp.next.nil?
        previousToLast = temp
        temp = temp.next
      end
      previousToLast.next = nil
      @tail = previousToLast
    end
  end

  # This method prints out a representation of the list.
  def print
    value = @head
    while !value.nil?
      puts value.data
      value = value.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      remove_front
    elsif @tail == node
      remove_tail
    else
      temp = @head
      until temp.next == node
        temp = temp.next
      end
      temp.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    return @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end

  def find(node)
    node = @head
    until node.data == node_data
      node = node.next
    end
    node
  end
end
