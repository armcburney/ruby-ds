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
      @heap[0], @heap[size - 1] = @heap[size - 1], @heap[0]
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
      @heap[parent_i], @heap[index] = @heap[index], @heap[parent_i]

      # Recurse up
      bubble_up(parent_i)
    end

    def bubble_down(index = 0)
      left  = @heap[left_child_index(index)]
      right = @heap[right_child_index(index)]
      curr  = @heap[index]

      return if (left.nil? || left >= curr) && (right.nil? || right >= curr)

      if !left.nil? && left < curr
        bubble_down(left_child_index(index))
      elsif !right.nil?
        bubble_down(right_child_index(index))
      end
    end

    def traverse_left(index = 0, count = 0)
      return count if out_of_bounds?(index)
      traverse_left(left_child_index(index), count + 1)
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
  end
end
