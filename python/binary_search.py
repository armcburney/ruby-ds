#!/usr/bin/python3

"""
Simple binary serach implementation in python3
"""

def binary_search(array, value):
    """
    Binary search on an array of ints. Returns index to value if it exists

    Time complexity: O(log n)
    Space complexity: O(1)
    """
    median_index = len(array) // 2

    if (array[median_index] == value):
        return (True, median_index)
    elif (array[median_index] < value):
        return binary_search(array[median_index:], value)
    else:
        return binary_search(array[:median_index], value)

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
binary_search(array, 7)
