/**
  * ThreeSum.scala
  *
  * @author: Andrew McBurney
  * @note:   Finds the indices of values in array that sum to 0 and prints
  * them
  */

package algorithms

object ThreeSum {
  /**
    * @usecase: Prints the indices of values in array that sum to 0
    * @note:    Time complexity: O(n^3)
    *           Spacial complexity: O(n^3)
    */
  def threeSum(arr: Array[Int], n: Int) =
    for (i <- 1 until n-2) {
      for (j <- i+1 until n-1) {
        for (k <- j+1 until n) {
          if (arr(i) + arr(j) + arr(k) == 0)
            println(s"$i, $j, $k")
        }
      }
    }

  def main(args: Array[String]): Unit = {
    val array = Array(0, -1, 8, 3, -2, 4, -5)
    threeSum(array, array.length)
  }
}
