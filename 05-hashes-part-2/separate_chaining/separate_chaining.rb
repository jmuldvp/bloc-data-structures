require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @i_ct = 0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    i = index(key, @items.size)
    n = Node.new(key, value)

    # Collision check
    @items[i] != nil ? list = @items[i] : list = LinkedList.new

    list.add_to_tail(n)
    @items[i] = list
    @i_ct = @i_ct + 1

    # Resize the hash if the load factor grows too large
    if load_factor.to_f > max_load_factor.to_f
      resize
    end
    # puts "Info: #{display_info}"
    # p "Key = #{key} : Value = #{value} is in slot #{index}"
  end

  def [](key)
    list = @items.at(index(key, @items.size))
    if list != nil
      curr = list.head
      while curr != nil
        if curr.key == key
          return curr.value
        end
        curr = curr.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    eachbyte = 0
    key.each_byte do |i|
      eachbyte += i
    end
    p "Index = #{eachbyte % size}"
    eachbyte % size
  end

  # Calculate the current load factor
  def load_factor
    puts @i_ct / self.size.to_f
    return @i_ct / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    new_size = size*2
    new_items = Array.new(new_size)
    (0..@items.size-1).each do |i|
      list = @items[i]
      if list != nil
        curr = list.head
        # We only need to compute the new index once
        new_index = index(curr.key, new_items.size)
        while curr != nil
          list = LinkedList.new
          list.add_to_tail(curr)
          new_items[new_index] = list
          curr = curr.next
        end
      end
    end
    @items = new_items
  end

  def display_info
    info = ""
  	if @items.length != 0
  		@items.each_with_index do |linkedlist, index|
  			if linkedlist != nil
  				linkedlist.each do |node|
  					info = "#{info}\n#{node.key}:#{node.value} is in slot #{index}"
  				end
  			end
  		end
  	end
    puts info
  end
end
