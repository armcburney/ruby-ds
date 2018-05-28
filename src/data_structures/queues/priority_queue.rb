# frozen_string_literal: true

module Algorithms
  # A priority queue implementation using a binary minimum heap.
  #
  # - Allows the user to order objects of arbitrary type by an integer priority.
  class PriorityQueue
    # Instantiates a new priority queue.
    def initialize
      @heap = []
    end

    # Inserts an element into the queue.
    #
    # Time complexity:
    #   O(log(n)) worst case
    #   O(log(n)) best case
    #
    # @param [Integer] val
    def push(object, priority:)
      @heap << [object, priority]
      bubble_up
    end

    alias << push

    # Deletes the minimum element from the queue.
    #
    # Time complexity:
    #   O(log(n)) worst case
    #   O(log(n)) best case
    #
    def pop
      swap!(0, size - 1)
      minimum, = @heap.pop
      bubble_down
      minimum
    end

    # Returns the minimum element of the queue.
    #
    # Time complexity:
    #   O(1) worst case
    #   O(1) best case
    #
    def min
      @heap.first.first
    end

    # Returns the size of the queue.
    #
    # Time complexity:
    #   O(1) worst case
    #   O(1) best case
    #
    def size
      @heap.size
    end

    # Returns `true` if the queue is empty.
    #
    # Time complexity:
    #   O(1) worst case
    #   O(1) best case
    #
    def empty?
      size.zero?
    end

    private

    def bubble_up(index = size - 1)
      parent_i = parent_index(index)

      # Base case, where the parent value is <=
      return if out_of_bounds?(parent_i) || @heap[parent_i].last <= @heap[index].last

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

    def current_and_children(index)
      [
        @heap[index]&.last,
        @heap[left_child_index(index)]&.last,
        @heap[right_child_index(index)]&.last
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
