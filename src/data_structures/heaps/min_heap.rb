# frozen_string_literal: true

module Algorithms
  class MinHeap
    # Instantiates a new minimum heap.
    def initialize
      @heap = []
    end

    # Inserts an element into the heap.
    #
    # Time complexity:
    #   O(log(n)) worst case
    #   O(log(n)) best case
    #
    # @param [Integer] val
    def insert(val)
      @heap << val
      bubble_up
    end

    # Deletes the minimum element from the heap.
    #
    # Time complexity:
    #   O(log(n)) worst case
    #   O(log(n)) best case
    #
    def delete_min
      swap!(0, size - 1)
      minimum = @heap.pop
      bubble_down
      minimum
    end

    # Returns the minimum element of the heap.
    #
    # Time complexity:
    #   O(1) worst case
    #   O(1) best case
    #
    def min
      @heap.first
    end

    # Returns the size of the heap.
    #
    # Time complexity:
    #   O(1) worst case
    #   O(1) best case
    #
    def size
      @heap.size
    end

    # Returns the height of the heap.
    #
    # Time complexity:
    #   O(log(n)) worst case
    #   O(log(n)) best case
    #
    def height
      traverse_left
    end

    # Returns `true` if the heap is empty.
    #
    # Time complexity:
    #   O(1) worst case
    #   O(1) best case
    #
    def empty?
      size.zero?
    end

    # Sorts an array using heap sort, in decreasing order.
    #
    # Time complexity:
    #   O(n * log(n)) worst case
    #   O(n * log(n)) average case
    #   O(n) best case
    #
    # @param [Array[Integer]] arr
    def self.decreasing_order_sort(arr)
      heap = MinHeap.new
      arr.each { |e| heap.insert(e) }
      arr.map  { heap.delete_min }
    end

    private

    def bubble_up(index = size - 1)
      parent_i = parent_index(index)

      # Base case, where the parent value is <=
      return if out_of_bounds?(parent_i) || @heap[parent_i] <= @heap[index]

      # Swap the values
      swap!(parent_i, index)

      # Recurse up
      bubble_up(parent_i)
    end

    def bubble_down(index = 0)
      # Get the values for the current node and its immediate children
      curr, left, right = current_and_children(index)

      # Base case, when the current element is less than the left and right
      # child, and not a leaf node
      return if (left.nil? || left >= curr) && (right.nil? || right >= curr)

      # Get the index of the next child to traverse to based on the properties
      # of the heap
      swapped_index = left.nil? || (!right.nil? && right < left) ? right_child_index(index) : left_child_index(index)

      # Swap the index and bubble down
      swap!(index, swapped_index)
      bubble_down(swapped_index)
    end

    def traverse_left(index = 0, count = 0)
      return count if out_of_bounds?(left_child_index(index))
      traverse_left(left_child_index(index), count + 1)
    end

    def current_and_children(index)
      [
        @heap[index],
        @heap[left_child_index(index)],
        @heap[right_child_index(index)]
      ]
    end

    def parent_index(index)
      ((index - 1) / 2).floor
    end

    def left_child_index(index)
      2 * index + 1
    end

    def right_child_index(index)
      2 * index + 2
    end

    def out_of_bounds?(index)
      index > size || index < 0
    end

    def swap!(index1, index2)
      @heap[index1], @heap[index2] = @heap[index2], @heap[index1]
    end
  end
end
