require_relative 'node'

class MinHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root
    parent_node = insert_heap(current_node, node)
    while parent_node.rating > node.rating
      node = sift(parent_node, node)
      parent_node = node.parent
    end
  end

  def find(root, data)
    temp = root
    if data.nil?
      return nil
    end
    if temp.title == data
        return temp
    end
    left = find(temp.left, data) if temp.left
    right = find(temp.right, data) if temp.right
    left or right
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    else
      temp = find(root, data)
      temp.nil? ? nil : (temp.title = nil && temp.rating = nil)
    end
  end

  def printf
    que = [@root]
    arr = []
    while que.length > 0
      temp = que.shift
      if !temp.left.nil?
        que.push(temp.left)
      end
      if !temp.right.nil?
        que.push(temp.right)
      end
      arr.push("#{temp.title}: #{temp.rating}")
    end
    arr.each {|x| puts x}
  end

  def insert_heap(temp, new_node)
    if temp.left == nil
      temp.left = new_node
      new_node.parent = temp
      return temp
    elsif temp.right == nil
      temp.right = new_node
      new_node.parent = temp
      return temp
    else
      arr = []
      arr.push(temp)
      while arr.size != 0
        n = arr.shift
        if n.left.left.nil? || n.left.right.nil?
          return insert_heap(n.left, new_node)
        elsif n.right.left.nil? || n.right.right.nil?
          return insert_heap(n.right, new_node)
        else
          n.children.each do |child|
            arr.push(child)
          end
        end
      end
    end
  end

  def sift(pnode, new_node)
    # left and right nodes into temp variables
    temp_l = new_node.left
    temp_r = new_node.right
    if pnode.left == new_node # Switch new_node and parent_node if new_node is on the left
      new_node.left = pnode
      if pnode.right
        new_node.right = pnode.right
        new_node.right.parent = new_node
      end
    else # If the new_node is on the right, shift the left node to the right, and the parent_node becomes the left node
      new_node.left = pnode
      new_node.right = pnode.left
      pnode.left.parent = new_node
    end
    new_node.parent = pnode.parent
    if new_node.parent.left == pnode
      new_node.parent.left = new_node
    else
      new_node.parent.right = new_node
    end
    pnode.parent = new_node
    pnode.left = temp_l
    pnode.right = temp_r
    return new_node
  end

  # def method_missing(method, *args, &block)
  #   "I haven't learned to #{method} yet :("
  # end
end
