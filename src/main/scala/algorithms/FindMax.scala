/**
  * FindMaximum.scala
  *
  * @author: Andrew McBurney
  * @fileoverview: finds the maximum value in an array in Theta(n) time
  */

package algorithms

import scala.annotation.tailrec

object FindMaximum {
  /**
    * @brief: Returns the max value of an array in optimal time with iteration
    *         Time complexity:    Theta(n)
    *         Spacial complexity: Theta(n)
    */
  def find_max(arr: Array[Int], n: Int): Int = {
    var max: Int = arr(0)
    for (i <- 1 until n-1)
      if (arr(i) > max) max = arr(i)

    max
  }

  /**
    * @brief: Returns the max value of an array in optimal time recursively
    *         Time complexity:    Theta(n)
    *         Spacial complexity: Theta(n)
    */
  def find_max_recursive(arr: Array[Int]): Int = {
    @tailrec
    def recurse(arr: Array[Int], max: Int): Int =
      if (arr.isEmpty) max
      else if (arr.head > max) recurse(arr.tail, arr.head)
      else recurse(arr.tail, max)

    recurse(arr.tail, arr.head)
  }
}
