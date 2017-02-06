/**
  * FindMaximum.scala
  *
  * @author: Andrew McBurney
  * @note:   Finds the maximum value in an array in Theta(n) time
  */

package algorithms

import scala.annotation.tailrec

object FindMaximum {
  /**
    * @usecase: Returns the max value of an array in optimal time with iteration
    * @note:    Time complexity:    Theta(n)
    *           Spacial complexity: Theta(n)
    */
  def find_max(arr: Array[Int], n: Int): Option[Int] = {
    if (n == 0) return None
    var max: Int = arr(0)
    for (i <- 1 until n-1)
      if (arr(i) > max) max = arr(i)

    Some(max)
  }

  /**
    * @usecase: Returns the max value of an array in optimal time recursively
    * @note:    Time complexity:    Theta(n)
    *           Spacial complexity: Theta(n)
    */
  def find_max_recursive(arr: Array[Int]): Option[Int] = {
    if (arr.length == 0) return None

    @tailrec
    def recurse(arr: Array[Int], max: Int): Int =
      if (arr.isEmpty) max
      else if (arr.head > max) recurse(arr.tail, arr.head)
      else recurse(arr.tail, max)

    Some(recurse(arr.tail, arr.head))
  }
}
