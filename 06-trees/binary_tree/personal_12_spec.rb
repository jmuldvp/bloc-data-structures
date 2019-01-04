include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  # Personal 12
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:live) { Node.new("Live Die Repeat", 72) }
  let (:heaven) { Node.new("My Blue Heaven", 78) }
  let (:rogue) { Node.new("Rogue One", 80) }
  let (:xmen) { Node.new("Xmen", 85) }
  let (:bournei) { Node.new("Bourne Identity", 86) }
  let (:arthur) { Node.new("King Arthur", 90) }
  let (:ryan) { Node.new("Saving Private Ryan", 91) }
  let (:ocean) { Node.new("Oceans 11", 92) }
  let (:pirates) { Node.new("Pirates of the Caribbean", 93) }
  let (:nacho) { Node.new("Nacho Libre", 94) }
  let (:fantastic) { Node.new("Fantastic Beasts", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, live)
      expect(root.left.title).to eq "Live Die Repeat"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, heaven)
      tree.insert(root, live)
      expect(root.left.left.title).to eq "Live Die Repeat"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, xmen)
      tree.insert(root, bournei)
      expect(root.left.right.title).to eq "Bourne Identity"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, arthur)
      expect(root.right.title).to eq "King Arthur"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, pirates)
      tree.insert(root, ocean)
      expect(root.right.left.title).to eq "Oceans 11"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, nacho)
      tree.insert(root, fantastic)
      expect(root.right.right.title).to eq "Fantastic Beasts"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, nacho)
      tree.insert(root, fantastic)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, live)
      expect(tree.find(root, live.title).title).to eq "Live Die Repeat"
    end

    it "properly finds a left-left node" do
      tree.insert(root, heaven)
      tree.insert(root, live)
      expect(tree.find(root, live.title).title).to eq "Live Die Repeat"
    end

    it "properly finds a left-right node" do
      tree.insert(root, xmen)
      tree.insert(root, bournei)
      expect(tree.find(root, bournei.title).title).to eq "Bourne Identity"
    end

    it "properly finds a right node" do
      tree.insert(root, arthur)
      expect(tree.find(root, arthur.title).title).to eq "King Arthur"
    end

    it "properly finds a right-left node" do
      tree.insert(root, pirates)
      tree.insert(root, ocean)
      expect(tree.find(root, ocean.title).title).to eq "Oceans 11"
    end

    it "properly finds a right-right node" do
      tree.insert(root, nacho)
      tree.insert(root, fantastic)
      expect(tree.find(root, fantastic.title).title).to eq "Fantastic Beasts"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, pirates)
      tree.delete(root, pirates.title)
      expect(tree.find(root, pirates.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(root, heaven)
      tree.insert(root, live)
      tree.delete(root, live.title)
      expect(tree.find(root, live.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, xmen)
      tree.insert(root, bournei)
      tree.delete(root, bournei.title)
      expect(tree.find(root, bournei.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, arthur)
      tree.delete(root, arthur.title)
      expect(tree.find(root, arthur.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, pirates)
      tree.insert(root, ocean)
      tree.delete(root, ocean.title)
      expect(tree.find(root, ocean.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, nacho)
      tree.insert(root, fantastic)
      tree.delete(root, fantastic.title)
      expect(tree.find(root, fantastic.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "The Matrix: 87\nRogue One: 80\nPirates of the Caribbean: 93\nLive Die Repeat: 72\nBourne Identity: 86\nOceans 11: 92\nNacho Libre: 94\nMy Blue Heaven: 78\nSaving Private Ryan: 91\nFantastic Beasts: 98\nKing Arthur: 90\n"
       tree.insert(root, pirates)   # 3
       tree.insert(root, nacho)     # 7
       tree.insert(root, rogue)     # 2
       tree.insert(root, ocean)     # 6
       tree.insert(root, live)      # 4
       tree.insert(root, bournei)   # 5
       tree.insert(root, heaven)    # 8
       tree.insert(root, ryan)      # 9
       tree.insert(root, arthur)    # 11
       tree.insert(root, fantastic) # 10
       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "The Matrix: 87\nMy Blue Heaven: 78\nFantastic Beasts: 98\nLive Die Repeat: 72\nBourne Identity: 86\nKing Arthur: 90\nRogue One: 80\nSaving Private Ryan: 91\nOceans 11: 92\nNacho Libre: 94\nPirates of the Caribbean: 93\n"
       tree.insert(root, fantastic)
       tree.insert(root, arthur)
       tree.insert(root, ryan)
       tree.insert(root, heaven)
       tree.insert(root, bournei)
       tree.insert(root, live)
       tree.insert(root, ocean)
       tree.insert(root, rogue)
       tree.insert(root, nacho)
       tree.insert(root, pirates)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
