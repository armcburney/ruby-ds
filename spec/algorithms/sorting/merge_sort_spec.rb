require_relative "../../../src/algorithms/sorting/merge_sort"

describe Array do
  describe "#merge_sort" do
    it "sorts a sample array" do
      array = [10, 3, 4, 1, 8, 5]
      expect(array.merge_sort).to match_array(array.sort)
    end

    it "sorts an array with duplicate numbers" do
      array = [0, 3, 0, 0, 1, 2, 4, 3, 2]
      expect(array.merge_sort).to match_array(array.sort)
    end

    it "sorts an array with negative numbers" do
      array = [-2, -3, -1, 5, 6, 7]
      expect(array.merge_sort).to match_array(array.sort)
    end

    it "'sorts' a one-element array" do
      array = [1]
      expect(array.merge_sort).to match_array(array.sort)
    end

    it "'sorts' a zero-element array" do
      array = []
      expect(array.merge_sort).to match_array(array.sort)
    end
  end
end
