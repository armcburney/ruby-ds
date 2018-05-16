# frozen_string_literal: true

class Array
  # Performs binary search on a sorted array to determine if the element exists
  # in the array.
  #
  # Usage:
  #   [1, 3, 5, 6].binary_search(3) # => true
  #   [1, 3, 5, 6].binary_search(2) # => false
  #
  # Time complexity:
  #   O(log(n)) worst case
  #   O(log(n)) average case
  #   O(1) best case
  #
  # @param [Integer] value
  # @return [Boolean]
  def binary_search(value)
    _binary_search(self, value, 0, size - 1)
  end

  private

  def _binary_search(arr, value, low, high)
    # Base case
    return false if low > high

    mid = low + (high - low) / 2

    # Found the value
    return true if arr[mid] == value

    # Recurse
    if value < arr[mid]
      _binary_search(arr, value, low, mid - 1)
    else
      _binary_search(arr, value, mid + 1, high)
    end
  end
end
