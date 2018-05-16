require_relative "../../src/algorithms/binary_search"

describe Array do
  describe "#binary_search" do
    it "returns `true` if the element exists in the array" do
      sorted_array = [1, 2, 3, 5, 9, 10]
      sorted_array.each do |value|
        expect(sorted_array.binary_search(value)).to be(true)
      end
    end

    it "returns `false` if the element does not exist in the array" do
      sorted_array = [1, 2, 3, 5, 9, 10]
      expect(sorted_array.binary_search(8)).to be(false)
    end

    it "works with duplicate elements" do
      sorted_array = [1, 2, 3, 5, 5, 5, 8, 9, 9, 10]
      expect(sorted_array.binary_search(2)).to be(true)
      expect(sorted_array.binary_search(5)).to be(true)
      expect(sorted_array.binary_search(9)).to be(true)
      expect(sorted_array.binary_search(11)).to be(false)
    end

    it "works with negative numbers" do
      sorted_array = [-2, -1, 1, 3, 5, 8, 9, 10]
      expect(sorted_array.binary_search(-2)).to be(true)
      expect(sorted_array.binary_search(-1)).to be(true)
      expect(sorted_array.binary_search(8)).to be(true)
      expect(sorted_array.binary_search(0)).to be(false)
      expect(sorted_array.binary_search(-3)).to be(false)
      expect(sorted_array.binary_search(11)).to be(false)
    end
  end
end
