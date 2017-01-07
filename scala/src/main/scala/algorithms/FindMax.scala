/**
  * FindMaximum.scala
  */

package algorithms

object FindMaximum {
  /**
    * Returns the max value of an array in optimal time. Theta(n)
    */
  def findMax(arr: Array[Int], n: Int): Int = {
    var max: Int = arr(0)

    for (i <- 1 until n-1) {
      if (arr(i) > max) max = arr(i)
    }

    return max
  }

  def main(args: Array[String]): Unit = {
    val array = Array(0,-1,8,3,-2,4,-5)
    println(findMax(array, array.length))
  }
}
