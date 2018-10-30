require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    new_item = Node.new(key, value)
    i = self.index(key, size)
    if @items[i] == nil
      @items[i] = new_item
    elsif @items[i].key != key
      self.resize
      self[key] = value
    elsif (@items[i].key === key) && (@items[i].value != value)
      if self.next_open_index(@items[i]) === -1
        self.resize
        @items[i] = value
      elsif self.next_open_index(@items[i]) != -1
        @items[i] = value
      end
    end
  end

  def [](key)
    if @items[index(key, size)] != nil && @items[index(key, size)].key === key
      @items[index(key, size)].value
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
    eachbyte % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    @items.each do |item|
      if item === nil
        return index #return index where item == nil
      else
        return -1
      end
    end
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |item|
      unless item === nil
        self[item.key] = item.value
      end
    end
  end

  def display_info
    puts "Number of items in hash: #{@item_count}"
    @items.each do |i|
      if i != nil
        ind = self.index(i.key, size)
        puts "Key: #{i.key}, Value: #{i.value}, Point in Array: #{ind}"
      end
    end
  end
end
