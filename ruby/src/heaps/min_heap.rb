# frozen_string_literal: true

module Algorithms
  class MinHeap
    # Instantiates a new minimum heap
    def initialize
      @heap = []
    end

    # O(log(n))
    def insert(val)
      @heap << val
      bubble_up
    end

    # O(log(n))
    def delete_min
      @heap[0], @heap[size - 1] = @heap[size - 1], @heap[0]
      min = @heap.pop
      bubble_down
      min
    end

    # O(1)
    def min
      @heap.first
    end

    # O(1)
    def size
      @heap.size
    end

    # O(log(n))
    def height
      traverse_left
    end

    # O(1)
    def empty?
      size.zero?
    end

    # Sorts an array using heap sort, in decreasing order
    def self.decreasing_order_sort(arr)
      heap = MinHeap.new
      arr.each { |e| heap.insert(e) }
      arr.map  { heap.delete_min }
    end

    private

    # O(log(n))
    def bubble_up(index = size - 1)
      parent_i = parent_index(index)

      # Base case, where the parent value is <=
      return if out_of_bounds?(parent_i) || @heap[parent_i] <= @heap[index]

      # Swap the values
      @heap[parent_i], @heap[index] = @heap[index], @heap[parent_i]

      # Recurse up
      bubble_up(parent_i)
    end

    # O(log(n))
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

    # O(log(n))
    def traverse_left(index = 0, count = 0)
      return count if out_of_bounds?(index)
      traverse_left(left_child_index(index), count + 1)
    end

    # O(1)
    def parent_index(index)
      ((index - 1) / 2).floor
    end

    # O(1)
    def left_child_index(index)
      2 * index + 1
    end

    # O(1)
    def right_child_index(index)
      2 * index + 2
    end

    # O(1)
    def out_of_bounds?(index)
      index > size || index < 0
    end
  end
end
