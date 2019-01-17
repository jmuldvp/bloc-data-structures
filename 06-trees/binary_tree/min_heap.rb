require_relative 'node'
require 'benchmark'

class MinHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      temp, @root, node = root, node, temp
      insert(@root, node)
    else
      if root.left.nil?
        root.left = node
      elsif root.right.nil? && !root.left.nil?
        root.right = node
      elsif !root.left.nil? && !root.right.nil? && !root.left.left.nil? && !root.left.right.nil?
        insert(root.right, node)
      elsif !root.left.nil? && !root.right.nil?
        insert(root.left, node)
      end
    end
  end

  def find(root, data)
    return nil if data.nil? || root.nil?
    if root.title == data
      return root
    else
      node = find(root.left, data)
      if node.nil?
        node = find(root.right, data)
      end
    end
    return node
  end

  def delete(root, data)
    if data.nil? || root.nil?
      return nil
    else
      target_node = find(root, data)
      target_node.nil? ? nil : (target_node.title = nil && target_node.rating = nil)
    end
  end

  def printf(children=nil)
    que, res = [@root], []
    while que.length > 0
      new_root = que.shift
      return que.push(new_root.left) if !new_root.left.nil?
      # if new_root.left != nil
      #   que.push(new_root.left)
      # end
      return que.push(new_root.right) if !new_root.right.nil?
      # if new_root.right != nil
      #   que.push(new_root.right)
      # end
      res.push("#{new_root.title}: #{new_root.rating}")
    end
    res.each {|x| puts x}
  end

end
