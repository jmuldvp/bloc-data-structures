class Node
  attr_accessor :title, :rating, :left, :right, :parent

  def initialize(title, rating)
    @title = title
    @rating = rating
    @parent = parent
    @left = left
    @right = right
  end

  def children
    [@left, @right].compact # Returns a copy of self with all nil elements removed.
  end

end
