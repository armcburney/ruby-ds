require_relative "../../../src/data_structures/heaps/min_heap"

describe Algorithms::MinHeap do
  subject { described_class.new }

  describe "#insert" do
    it "inserts properly into the heap" do
    end
  end

  describe "#delete_min" do
    it "deletes properly from the heap" do
      arr = [8, 2, 1, 4, 9, 7, 3]
      arr.each { |e| subject.insert(e) }

      arr.sort.each do |lowest_value|
        expect(subject.min).to be(lowest_value)
        expect(subject.delete_min).to be(lowest_value)
      end
    end
  end

  describe "#min" do
    it "returns the min value in the heap" do
      arr = [8, 2, 1, 4, 9, 7, 3]
      arr.each { |e| subject.insert(e) }
      expect(subject.min).to be(1)
    end
  end

  describe "#size" do
    it "returns the proper size of the heap" do
      arr = [8, 2, 1, 4, 9, 7, 3]
      arr.each { |e| subject.insert(e) }
      expect(subject.size).to be(arr.size)
    end
  end

  describe "#height" do
    it "returns the proper height of the heap" do
      arr = [8, 2, 1, 4, 9, 7, 3]
      arr.each { |e| subject.insert(e) }

      expected_height = Math.log(arr.size, 2).ceil
      expect(subject.height).to be(expected_height)
    end

    it "returns `1` if the heap has one element" do
      subject.insert(1)
      expect(subject.height).to be(1)
    end

    it "returns `0` if the heap is empty" do
      expect(subject.height).to be(0)
    end
  end

  describe "#empty?" do
    it "returns `true` if the heap is empty" do
      expect(subject.empty?).to be(true)
    end

    it "returns `false` if the heap is not empty" do
      subject.insert(1)
      expect(subject.empty?).to be(false)
    end
  end

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
