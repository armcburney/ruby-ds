# frozen_string_literal: true

module Algorithms
  class BinaryTree
    # The root node of the tree.
    #
    # @return [Algorithms::Node]
    attr_reader :root

    # Instantiates a new binary tree.
    #
    # @param [Algorithms::Node] root
    def initialize(root = nil)
      @root = root
    end

    # Recursively inserts a new node into the tree.
    # Runtime: O(n) worst-case since it's not a balanced tree.
    #
    # @param [Algorithms::Node] node
    # @param [Algorithms::Node] curr
    def insert(node, curr = root)
      if root.nil?
        @root = node
      elsif node.val >= curr.val && curr.right.nil?
        node.parent = curr
        curr.right = node
      elsif node.val >= curr.val
        insert(node, curr.right)
      elsif curr.left.nil?
        node.parent = curr
        curr.left = node
      else
        insert(node, curr.left)
      end
    end

    # Recursively deletes a node if it exists in the tree.
    # Runtime: O(n) worst-case since it's not a balanced tree.
    #
    # @param [Algorithms::Node] node
    def delete(node)
      raise "Node doesn't exist in tree." if node.nil?

      if node.left.nil? && node.right.nil?
        swap!(node, nil)
      elsif !node.left.nil? && !node.right.nil?
        replacement_node = find_min(node.right)
        node.val = replacement_node.val
        delete(replacement_node)
      elsif node.left.nil?
        swap!(node, node.right)
      else
        swap!(node, node.left)
      end
    end

    # Finds and returns a node with the value in a subtree.
    #
    # @param [Integer] val
    # @param [Algorithms::Node] node
    # @return [Algorithms::Node]
    def find_node(val, node = root)
      return nil if node.nil?
      return node if node.val == val

      if val > node.val
        find_node(val, node.right)
      else
        find_node(val, node.left)
      end
    end

    # Returns the height of the tree.
    #
    # @param [Algorithms::Node] node
    # @param [Integer] h
    # @return [Integer]
    def height(node = root, h = 1)
      return h if node.left.nil? && node.right.nil?

      if !node.left.nil? && !node.right.nil?
        [height(node.left, h + 1), height(node.right, h + 1)].max
      elsif node.left.nil?
        height(node.right, h + 1)
      else
        height(node.left, h + 1)
      end
    end

    # Finds and returns the minimum element in a subtree.
    #
    # @param [Algorithms::Node] node
    # @return [Algorithms::Node]
    def find_min(node = root)
      return node if node.left.nil?
      find_min(node.left)
    end

    # Finds and returns the maximum element in a subtree.
    #
    # @param [Algorithms::Node] node
    # @return [Algorithms::Node]
    def find_max(node = root)
      return node if node.right.nil?
      find_max(node.right)
    end

    # Returns the number of nodes beneath a given node.
    #
    # @param [Algorithms::Node] node
    # @return [Integer]
    def count_nodes(node = root)
      return 1 if node.left.nil? && node.right.nil?

      if !node.left.nil? && !node.right.nil?
        count_nodes(node.left) + count_nodes(node.right) + 1
      elsif node.left.nil?
        count_nodes(node.right) + 1
      else
        count_nodes(node.left) + 1
      end
    end

    # Returns `true` if the binary subtree is valid.
    #
    # @param [Algorithms::Node] node
    # @return [Boolean]
    def valid?(node = root)
      return true if node.left.nil? && node.right.nil?

      if !node.left.nil? && !node.right.nil?
        return false if node.left.val >= node.val || node.right.val < node.val
        valid?(node.left) && valid?(node.right)
      elsif node.left.nil?
        return false if node.right.val < node.val
        valid?(node.right)
      else
        return false if node.left.val >= node.val
        valid?(node.left)
      end
    end

    private

    def swap!(node, replacement)
      parent = node.parent

      if parent.nil?
        @root = replacement
      elsif !parent.left.nil? && parent.left.val == node.val
        parent.left = replacement
      else
        parent.right = replacement
      end
    end
  end
end
