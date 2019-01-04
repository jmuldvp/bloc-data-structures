class Node
  attr_accessor :title, :rating, :left, :right

  def initialize(title, rating)
    @title, @rating, @left, @right = title, rating, nil, nil
  end
end
