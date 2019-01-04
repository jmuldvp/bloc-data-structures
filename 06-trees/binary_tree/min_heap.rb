require_relative 'node'
require 'benchmark'

class MinHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      @root, temp, node = node, root, temp
    else

    end
  end

  def find(root, data)
    if root.title == data
      return root
    end

  end

  def delete(root, data)

  end

  def printf(children=nil)

  end

end
