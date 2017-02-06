/**
  * BinarySearch.scala
  *
  * @author: Andrew McBurney
  * @note:   Finds a value in an array in O(log(n)) time
  */

package algorithms

import scala.annotation.tailrec

object BinarySearch {
  /**
    * @usecase: Returns true if the value exists in the array
    *           using the tail recursion optimization
    * @param:   arr: Array[Int] - Sorted array of ints
    * @param:   key: Int - value searching for
    * @return:  :Boolean - true if found, false if not
    * @note:    Time complexity:    O(log(n)) - splits input in half each call
    */
  @tailrec
  def binary_search(arr: Array[Int], key: Int): Boolean = {
    val median: Int = arr.length / 2
    if (arr.isEmpty) false
    else if (arr(median) == key) true
    else if (arr(median) > key) binary_search(arr.take(median), key)
    else binary_search(arr.takeRight(median), key)
  }
}
