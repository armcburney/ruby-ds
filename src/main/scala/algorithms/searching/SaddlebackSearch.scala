/**
  * SaddlebackSearch.scala
  *
  * @author: Andrew McBurney
  * @note:   Finds a value in an a sorted matrix.
  *
  * Start at the top right corner of the matrix:
  *
  * - move down if the key is greater than the value at a given index (since all
  * values below in a column are greater)
  * - move left if the key is less than a given index (since all values to the
  * left in a row are lesser)
  *
  * Worst case time: O(n) + O(m) => O(n + m)
  *
  * Worst case time happens when the algorithms moves along the borders of the
  * matrix to the bottom left position (Either all down, then all left, or all
  * left then all down)
  */

package algorithms.searching

import scala.annotation.tailrec

object SaddlebackSearch {
  /**
    * @usecase: Returns true if the value exists in the matrix using the tail
    *           recursion optimization
    * @tparam:  arr: Array[Array[Int] - Sorted matrix of ints
    * @return:  :Boolean - true if found, false if not
    * @note:    Time complexity:    O(m + n)
    */
  def saddleback_search(grid: Array[Array[Int]], key: Int): Boolean = {
    @tailrec
    def search(m: Int, n: Int): Boolean =
      if (key == grid(m)(n)) true
      else if (m == grid.size - 1 && n == 0) false
      else if (key > grid(m)(n) && m != grid.size - 1) search(m + 1, n)
      else if (key < grid(m)(n) && n != 0) search(m, n - 1)
      else false // out of bounds of grid

    search(0, grid.size - 1)
  }
}
