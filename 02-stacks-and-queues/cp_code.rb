def reverse(original)
  stack = new Stack()
  original.each_char { |char| stack.push(char) }
  reversed = ""
  while !stack.empty?
    reversed << stack.pop
  end
  reversed
end

reverse("gnirtS")
#=> "String"
reverse("racecaR")
#=> "Racecar"
