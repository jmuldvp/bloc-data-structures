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
    if !@tail.nil?
      @tail.next = node
    end
    @tail = node

    # if @head.nil?
    #   @head = @tail
    # else
    #   temp = @head
    #   until temp.next.nil?
    #     temp = temp.next
    #   end
    #   @tail = temp
    #   @head
    # end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    # ctemp = @head
    # ct = 0
    # while ctemp
    #   ct += 1
    #   ctemp = ctemp.next
    # end
    #
    # if @head == nil
    #   return
    # end
    #
    # temp = @head
    #
    # if ct == 0
    #   @head = temp.next
    #   temp = nil
    # end


    if @head == nil
      @tail = nil
    else
      temp = @head
      previousToLast = nil
      until temp.next.nil?
        previousToLast = temp
        temp = temp.next
      end
      previousToLast = nil
      @tail = previousToLast
    end
  end

  # This method prints out a representation of the list.
  def print
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
  end

  # This method removes and returns the first node in the Linked List and must set
  # Linked List's head to the second node.
  def remove_front
  end
end
