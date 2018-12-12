# frozen_string_literal: true

module Algorithms
  class MaxHeap
    # Instantiates a new maximum heap.
    def initialize
      @heap = []
    end

    # Inserts an element into the heap.
    #
    # @param [Integer] val
    def insert(val)
      raise "Not implemented!"
    end

    # Deletes the maximum element from the heap.
    #
    # @return [Integer]
    def delete_max
      raise "Not implemented!"
    end

    # Returns the maximum element of the heap.
    #
    # @return [Integer]
    def max
      raise "Not implemented!"
    end

    # Returns the size of the heap.
    #
    # @return [Integer]
    def size
      raise "Not implemented!"
    end

    # Returns the height of the heap.
    #
    # @return [Integer]
    def height
      raise "Not implemented!"
    end

    # Returns `true` if the heap is empty.
    #
    # @return [Boolean]
    def empty?
      raise "Not implemented!"
    end

    # Sorts an array using heap sort, in increasing order.
    #
    # @param  [Array[Integer]] arr
    # @return [Array[Integer]]
    def self.increasing_order_sort(arr)
      raise "Not implemented!"
    end
  end
end
