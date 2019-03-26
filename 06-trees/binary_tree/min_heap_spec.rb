include RSpec

require_relative 'min_heap'

RSpec.describe MinHeap, type: Class do
  let (:root) { Node.new("Band of Brothers", 72) }
  let (:tree) { MinHeap.new(root) }
  let (:ryan) { Node.new("Saving Private Ryan", 78) }
  let (:bob) { Node.new("What About Bob?", 80) }
  let (:rogue) { Node.new("Rogue One", 85) }
  let (:heaven) { Node.new("My Blue Heaven", 86) }
  let (:strange) { Node.new("Dr. Strange", 87) }
  let (:solo) { Node.new("Solo", 90) }
  let (:nobody) { Node.new("My Name Is Nobody", 91) }
  let (:ldr) { Node.new("Live, Die, Repeat", 92) }
  let (:fantastic) { Node.new("Fantastic Beasts", 93) }
  let (:bourneid) { Node.new("Bourne Identity", 94) }
  let (:oceans11) { Node.new("Oceans 11", 98) }

  # let (:root) { Node.new("Band of Brothers", 87) }
  # let (:tree) { MinHeap.new(root) }
  # let (:ryan) { Node.new("Saving Private Ryan", 72) }
  # let (:bob) { Node.new("What About Bob?", 78) }
  # let (:rogue) { Node.new("Rogue One", 80) }
  # let (:heaven) { Node.new("My Blue Heaven", 85) }
  # let (:strange) { Node.new("Dr. Strange", 86) }
  # let (:solo) { Node.new("Solo", 90) }
  # let (:nobody) { Node.new("My Name Is Nobody", 91) }
  # let (:ldr) { Node.new("Live, Die, Repeat", 92) }
  # let (:fantastic) { Node.new("Fantastic Beasts", 93) }
  # let (:bourneid) { Node.new("Bourne Identity", 94) }
  # let (:oceans11) { Node.new("Oceans 11", 98) }

  describe "#insert(data)" do
     it "properly inserts a new node as a left child" do
       tree.insert(root, ryan)
       expect(root.left.title).to eq "Saving Private Ryan"
     end

     it "properly inserts a new node as a right child" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       expect(root.right.title).to eq "What About Bob?"
     end

     it "properly inserts a new node as a left-left child" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       expect(root.left.left.title).to eq "Rogue One"
     end

     it "properly inserts a new node as a left-right child" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       expect(root.left.right.title).to eq "Dr. Strange"
     end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, ryan)
      expect(root.left).to eq(ryan)

      tree.insert(root, bob)
      expect(root.right).to eq(bob)

      tree.insert(root, rogue)
      expect(root.left.left).to eq(rogue)

      tree.insert(root, strange)
      expect(root.left.right).to eq(strange)

      tree.insert(root, heaven)
      expect(root.right.left).to eq(heaven)
    end

     it "properly inserts a new node as a right-right child" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       tree.insert(root, heaven)
       tree.insert(root, solo)
       expect(root.right.right.title).to eq "Solo"
     end
  end

   describe "#find(data)" do
     it "handles nil gracefully" do
       tree.insert(root, bourneid)
       tree.insert(root, oceans11)
       expect(tree.find(root, nil)).to eq nil
     end

     it "properly finds a left node" do
       tree.insert(root, ryan)
       expect(tree.find(root, ryan.title).title).to eq "Saving Private Ryan"
     end

     it "properly finds a right node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       expect(tree.find(root, bob.title).title).to eq "What About Bob?"
     end

     it "properly finds a left-left node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       expect(tree.find(root, rogue.title).title).to eq "Rogue One"
     end

     it "properly finds a left-right node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       expect(tree.find(root, strange.title).title).to eq "Dr. Strange"
     end

     it "properly finds a right-left node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       tree.insert(root, heaven)
       expect(tree.find(root, heaven.title).title).to eq "My Blue Heaven"
     end

     it "properly finds a right-right node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       tree.insert(root, heaven)
       tree.insert(root, solo)
       expect(tree.find(root, solo.title).title).to eq "Solo"
     end
   end

   describe "#delete(data)" do
     it "handles nil gracefully" do
       expect(tree.delete(root, nil)).to eq nil
     end

     it "properly deletes a left node" do
       tree.insert(root, ryan)
       tree.delete(root, ryan.title)
       expect(tree.find(root, ryan.title)).to be_nil
     end

     it "properly deletes a right node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.delete(root, bob.title)
       expect(tree.find(root, bob.title)).to be_nil
     end

     it "properly deletes a left-left node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.delete(root, rogue.title)
       expect(tree.find(root, rogue.title)).to be_nil
     end

     it "properly deletes a left-right node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       tree.delete(root, strange.title)
       expect(tree.find(root, strange.title)).to be_nil
     end

     it "properly deletes a right-left node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       tree.insert(root, heaven)
       tree.delete(root, heaven.title)
       expect(tree.find(root, heaven.title)).to be_nil
     end

     it "properly deletes a right-right node" do
       tree.insert(root, ryan)
       tree.insert(root, bob)
       tree.insert(root, rogue)
       tree.insert(root, strange)
       tree.insert(root, heaven)
       tree.insert(root, solo)
       tree.delete(root, solo.title)
       expect(tree.find(root, solo.title)).to be_nil
     end
   end

  describe "#printf" do
    it "should print" do
      expected_output = "Band of Brothers: 72\nSaving Private Ryan: 78\nWhat About Bob?: 80\nRogue One: 85\nDr. Strange: 87\nMy Blue Heaven: 86\nSolo: 90\nMy Name Is Nobody: 91\nLive, Die, Repeat: 92\nFantastic Beasts: 93\nBourne Identity: 94\nOceans 11: 98\n"
      tree.insert(root, ryan)
      tree.insert(root, bob)
      tree.insert(root, rogue)
      tree.insert(root, strange)
      tree.insert(root, heaven)
      tree.insert(root, solo)
      tree.insert(root, nobody)
      tree.insert(root, ldr)
      tree.insert(root, fantastic)
      tree.insert(root, bourneid)
      tree.insert(root, oceans11)
      tree.printf
      expect { tree.printf }.to output(expected_output).to_stdout
    end
  end
end
