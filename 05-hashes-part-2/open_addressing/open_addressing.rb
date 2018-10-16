require_relative 'node'

class OpenAddressing
  def initialize(size)
    @size = size
  end

  def []=(key, value)
  end

  def [](key)
    index = self.index(key, size)
    @items[index].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    eachbyte = 0
    key.each_byte do |i|
      eachbyte += i
    end
    eachbyte % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    @items.each do |item|
      item === nil ? index : -1
    end
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    prev_arr = @items
    @items = Array.new(size * 2)

    for item in prev_arr do
      if item
        index = index(item.key, size)
        @items[index] = item
      end
    end
  end
end
