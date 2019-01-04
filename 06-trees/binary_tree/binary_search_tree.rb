require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.nil?
      root = node
    end
    temp = root

    if node.rating <= temp.rating
      temp.left.nil? ? temp.left = node : insert(temp.left, node)
    else
      temp.right.nil? ? temp.right = node : insert(temp.right, node)
    end
  end

  # Recursive DFS
  def find(root, data)
    if root.title == data
      return root
    end

    if root.left != nil
      left = find(root.left, data)
      if left != nil
        return left
      end
    end

    if root.right != nil
      right = find(root.right, data)
      if right != nil
        return right
      end
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    end

    if root.left
      if root.left.title === data
        temp = root.left
        root.left = temp.left
        temp.title = nil
        temp.rating = nil
        if root.left != nil
          root.left.right = temp.right
        end
      else
        delete(root.left, data)
      end
    end

    if root.right
      if root.right.title === data
        temp = root.right
        root.right = temp.right
        temp.title = nil
        temp.rating = nil
        if root.right != nil
          root.right.left = temp.left
        end
      else
        delete(root.right, data)
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    line = [@root]

    line.each do |i|
      puts "#{i.title}: #{i.rating}"
      if i.left
        line << i.left
      end
      if i.right
        line << i.right
      end
    end
  end
end
