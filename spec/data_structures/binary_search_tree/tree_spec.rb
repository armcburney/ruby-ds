require_relative "../../../src/data_structures/binary_search_tree/node"
require_relative "../../../src/data_structures/binary_search_tree/binary_tree"

describe Algorithms::BinaryTree do
  subject { described_class.new }

  describe "#insert" do
    context "normal tree" do
      it "properly inserts values into the tree, in their correct order" do
        tree = normal_tree

        # Assert root
        expect(tree.root.val).to be(5)

        # Assert left subtree
        expect(tree.root.left.val).to be(3)
        expect(tree.root.left.left.val).to be(2)
        expect(tree.root.left.right.val).to be(4)
        expect(tree.root.left.left.left.val).to be(1)

        # Assert right subtree
        expect(tree.root.right.val).to be(7)
        expect(tree.root.right.left.val).to be(6)
      end
    end
  end

  describe "#delete" do
    context "normal tree" do
      it "properly deletes a leaf node" do
        tree = normal_tree
        node = tree.find_node(1)
        tree.delete(node)

        # Assert root
        expect(tree.root.val).to be(5)

        # Assert left subtree
        expect(tree.root.left.val).to be(3)
        expect(tree.root.left.left.val).to be(2)
        expect(tree.root.left.right.val).to be(4)

        # Assert right subtree
        expect(tree.root.right.val).to be(7)
        expect(tree.root.right.left.val).to be(6)
      end

      it "properly deletes a node with one child" do
        tree = normal_tree
        node = tree.find_node(7)
        tree.delete(node)

        # Assert root
        expect(tree.root.val).to be(5)

        # Assert left subtree
        expect(tree.root.left.val).to be(3)
        expect(tree.root.left.left.val).to be(2)
        expect(tree.root.left.right.val).to be(4)
        expect(tree.root.left.left.left.val).to be(1)

        # Assert right subtree
        expect(tree.root.right.val).to be(6)
      end

      it "properly deletes a node with two children" do
        tree = normal_tree
        node = tree.find_node(3)
        tree.delete(node)

        # Assert root
        expect(tree.root.val).to be(5)

        # Assert left subtree
        expect(tree.root.left.val).to be(4)
        expect(tree.root.left.left.val).to be(2)
        expect(tree.root.left.left.left.val).to be(1)

        # Assert right subtree
        expect(tree.root.right.val).to be(7)
        expect(tree.root.right.left.val).to be(6)
      end

      it "properly deletes the root" do
        tree = normal_tree
        node = tree.find_node(5)
        tree.delete(node)

        # Assert root
        expect(tree.root.val).to be(6)

        # Assert left subtree
        expect(tree.root.left.val).to be(3)
        expect(tree.root.left.left.val).to be(2)
        expect(tree.root.left.right.val).to be(4)
        expect(tree.root.left.left.left.val).to be(1)

        # Assert right subtree
        expect(tree.root.right.val).to be(7)
      end
    end

    context "other tree" do
      it "properly deletes the root" do
        tree = other_tree
        node = tree.find_node(6)
        tree.delete(node)

        # Assert root
        expect(tree.root.val).to be(7)

        # Assert left subtree
        expect(tree.root.left.val).to be(5)

        # Assert right subtree
        expect(tree.root.right.val).to be(8)
      end
    end
  end

  describe "#find_node" do
  end

  describe "#height" do
    context "normal tree" do
      it "returns the height of the tree" do
        tree = normal_tree
        expect(tree.height).to be(4)
      end
    end

    context "skinny tree" do
      it "returns the height of the tree" do
        tree = skinny_tree
        expect(tree.height).to be(6)
      end
    end
  end

  describe "#find_min" do
    context "normal tree" do
      it "returns the minimum element in the tree" do
        tree = normal_tree
        expect(tree.find_min.val).to be(1)
      end
    end

    context "skinny tree" do
      it "returns the minimum element in the tree" do
        tree = skinny_tree
        expect(tree.find_min.val).to be(1)
      end
    end
  end

  describe "#find_max" do
    context "normal tree" do
      it "returns the maximum element in the tree" do
        tree = normal_tree
        expect(tree.find_max.val).to be(7)
      end
    end
  end

  describe "#next_highest_node" do
    context "normal tree" do
      it "returns the next highest node for the root" do
        tree = normal_tree
        expect(tree.next_highest_node.val).to be(6)
      end
    end
  end

  describe "#count_nodes" do
    context "normal tree" do
      it "returns the number of elements in the tree when given root value" do
        tree = normal_tree
        expect(tree.count_nodes(tree.root)).to be(7)
      end

      it "returns number of elements in left subtree" do
        tree = normal_tree
        expect(tree.count_nodes(tree.root.left)).to be(4)
      end

      it "returns number of elements in right subtree" do
        tree = normal_tree
        expect(tree.count_nodes(tree.root.right)).to be(2)
      end
    end

    context "skinny tree" do
      it "returns the number of elements in the tree when given root value" do
        tree = skinny_tree
        expect(tree.count_nodes(tree.root)).to be(6)
      end
    end
  end

  describe "#valid?" do
    context "normal tree" do
      it "returns true" do
        tree = normal_tree
        expect(tree.valid?).to be(true)
      end
    end

    context "skinny tree" do
      it "returns true" do
        tree = skinny_tree
        expect(tree.valid?).to be(true)
      end
    end

    context "other tree" do
      it "returns true" do
        tree = other_tree
        expect(tree.valid?).to be(true)
      end
    end
  end

  def normal_tree
    tree = Algorithms::BinaryTree.new
    [5, 3, 7, 4, 6, 2, 1].each { |i| tree.insert(Algorithms::Node.new(i)) }
    tree
  end

  def other_tree
    tree = Algorithms::BinaryTree.new
    [6, 5, 7, 8].each { |i| tree.insert(Algorithms::Node.new(i)) }
    tree
  end

  def skinny_tree
    tree = Algorithms::BinaryTree.new
    [1, 2, 3, 4, 5, 6].each { |i| tree.insert(Algorithms::Node.new(i)) }
    tree
  end
end
