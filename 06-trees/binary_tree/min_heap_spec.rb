include RSpec

require_relative 'min_heap'

RSpec.describe MinHeap, type: Class do
  let (:root) { Node.new("Band of Brothers", 87) }

  let (:tree) { MinHeap.new(root) }
  let (:ryan) { Node.new("Saving Private Ryan", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:heaven) { Node.new("My Blue Heaven", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:solo) { Node.new("Solo", 90) }
  let (:nobody) { Node.new("My Name Is Nobody", 91) }
  let (:ldr) { Node.new("Live, Die, Repeat", 92) }
  let (:beasts) { Node.new("Fantastic Beasts", 93) }
  let (:bourneid) { Node.new("Bourne Identity", 94) }
  let (:oceans11) { Node.new("Oceans 11", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, ryan)
      expect(tree.root.title).to eq "Saving Private Ryan"
    end

    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, ryan)
      expect(tree.root.left.title).to eq "Band of Brothers"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, ryan)
      expect(tree.root.left.left.title).to eq "Band of Brothers"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, heaven)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, ryan)
      tree.insert(tree.root, solo)
      expect(tree.root.right.title).to eq "Solo"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, ryan)
      tree.insert(tree.root, solo)
      tree.insert(tree.root, beasts)
      tree.insert(tree.root, ldr)
      tree.insert(tree.root, oceans11)
      expect(tree.root.right.left.title).to eq "Oceans 11"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, ryan)
      tree.insert(tree.root, solo)
      tree.insert(tree.root, beasts)
      tree.insert(tree.root, ldr)
      tree.insert(tree.root, oceans11)
      tree.insert(tree.root, bourneid)
      expect(tree.root.right.right.title).to eq "Bourne Identity"
    end
  end

  describe "#print" do
    it "should print" do
      tree.insert(tree.root, ryan)
      tree.insert(tree.root, solo)
      tree.insert(tree.root, beasts)
      tree.insert(tree.root, ldr)
      tree.insert(tree.root, oceans11)
      tree.insert(tree.root, bourneid)
      tree.printf()
   end
  end
end
