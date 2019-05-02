require 'pry'

class Node
  attr_accessor :name, :film_actor_hash, :visited

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new {}
    @visited = []
  end
end
