# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    return self.members[0]
  end

  def middle
    mid = self.members.length / 2
    return self.members[mid]
  end

  def back
    len = self.members.length
    return self.members[len - 1]
  end

  def search(person)
    # self.members.select { |a| a == person }
    # self.members.grep(person)
    if self.members.include?(person)
      return person
    end
  end

  private

  def index(person)
    self.members.index(person)
  end

end
