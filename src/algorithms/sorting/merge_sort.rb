# frozen_string_literal: true

class Array
  # Performs merge sort on an array of elements.
  #
  # Usage:
  #   [5, 3, 4, 2].merge_sort # => [2, 3, 4, 5]
  #
  # Time complexity:
  #   O(n * log(n)) worst case
  #   O(n * log(n)) average case
  #   O(n * log(n)) best case
  #
  # @return [Array[Integer]]
  def merge_sort
    _merge_sort(self)
  end

  private

  def _merge_sort(arr)
    return arr if arr.size <= 1
    mid = arr.size / 2
    merge(_merge_sort(arr[0...mid]), _merge_sort(arr[mid..-1]))
  end

  def merge(arr1, arr2)
    i, j = 0, 0

    (arr1 + arr2).map do
      if j >= arr2.size || i < arr1.size && arr1[i] <= arr2[j]
        i += 1
        arr1[i - 1]
      elsif j < arr2.size
        j += 1
        arr2[j - 1]
      end
    end
  end
end
