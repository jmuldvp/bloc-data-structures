require 'benchmark'

require_relative 'binary_search_tree'
require_relative 'min_heap'

bin_root = Node.new("binary root", 1)
heap_root = Node.new("heap root", 1)
bin = BinarySearchTree.new(bin_root)
heap = MinHeap.new(heap_root)

n = 100_000

Benchmark.bm(20) do |x|
  x.report("tree insert") do
    for i in 2..n do
      new_node = Node.new("tree", Random.rand(10_000_000))
      bin.insert(bin_root, new_node)
    end
  end
  x.report("heap insert") do
    for i in 2..n do
      new_node = Node.new("heap", i)
      heap.insert(heap_root, new_node)
    end
  end
end

target = Node.new("target", 50_000)
bin.insert(bin_root, target)
heap.insert(heap_root, target)

Benchmark.bm(20) do |x|
  x.report("tree find") do
    bin.find(bin_root, 50_000)
  end
  x.report("heap find") do
    heap.find(heap_root, 50_000)
  end
end

Benchmark.bm(20) do |x|
  x.report("tree delete") do
    bin.delete(bin_root, 75_000)
  end
  x.report("heap delete") do
    heap.delete(heap_root, 75_000)
  end
end
