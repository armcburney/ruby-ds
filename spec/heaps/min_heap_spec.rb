require_relative "../../src/heaps/min_heap"

describe Algorithms::MinHeap do
  subject { described_class.new }

  describe "self.decreasing_order_sort" do
    it "sorts an array in reverse order" do
      arr = [8, 2, 1, 4, 9, 7, 3]
      sorted_arr = Algorithms::MinHeap.decreasing_order_sort(arr)
      expect(sorted_arr).to match_array(arr.sort.reverse)
    end

    it "sorts another array in reverse order" do
      arr = [-2, -4, -5, -1, -8, -10]
      sorted_arr = Algorithms::MinHeap.decreasing_order_sort(arr)
      expect(sorted_arr).to match_array(arr.sort.reverse)
    end
  end
end
