require_relative 'node'

class SixDegrees

  def initialize
    @actors_visited = []
  end

  def find_kevin_bacon(kb, target)
    return puts "Yes Kevin == Kevin" if kb == target
    @actors_visited.push(kb)
    list = []
    list.push(kb)

    while list.any?
      temp = list.shift
      temp.film_actor_hash.each do |film, cast|
        if cast.include?(target)
          return track(temp, film, target)
        else
          cast.each do |actor|
            next if (@actors_visited.include?(actor) || list.include?(actor))
            actor.visited.push(film).push(temp)
            list.push(actor)
            @actors_visited.push(actor)
          end
        end
      end
    end
    puts "There is no connection found between #{target.name} and Kevin Bacon."
  end

  def track(cur_node, lmovie, target)
    path = [lmovie]
    while cur_node.visited[1]
      path.unshift(cur_node.visited[0])
      if path.length > 6
        return puts "Mr. Bacon is more than 6 degrees away from #{target.name}."
      end
      cur_node = cur_node.visited[1]
    end
    puts "The movie path from #{target.name} to Mr Bacon is: #{path}"
  end
end
