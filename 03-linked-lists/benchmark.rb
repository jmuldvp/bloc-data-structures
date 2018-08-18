require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

ll = LinkedList.new
arr = []
n = 10_000

acc = []
for i in (1..5000)
  acc << i
end

llr = LinkedList.new
for i in 1..5001 do
  node2 = Node.new(i)
  llr.add_to_tail(node2)
end

Benchmark.bm(1) do |x|
  x.report('Add to array      :') do
    for i in 1..n do
      arr.push(i)
    end
  end

  x.report('Add to linked list:') do
    for i in 1..n do
      node = Node.new(i)
      ll.add_to_tail(node)
    end
  end

  x.report('Lookup 5000th array element: ') do
    acc[5000]
  end

  x.report("Lookup 5000th LL element   : ") do
    temp = ll.head
    for i in 1..5000
      temp = temp.next
    end
    temp
  end

  x.report('Remove 5000th arr element: ') do
    acc.delete_at(5000)
  end

  x.report('Remove 5000th ll element : ') do
    node = llr.find_data(5000)
    llr.delete(node)
  end
end
