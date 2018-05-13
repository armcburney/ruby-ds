# frozen_string_literal: true

module Algorithms
  class Node
    attr_accessor :val, :left, :right, :parent

    def initialize(val)
      @val    = val
      @left   = nil
      @right  = nil
      @parent = nil
    end
  end
end
