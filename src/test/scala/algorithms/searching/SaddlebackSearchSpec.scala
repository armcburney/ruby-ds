/**
  * SaddlebackSearchSpec.scala
  *
  * @author: Andrew McBurney
  * @note:   Test harness for SaddlebackSearch.scala
  */

package algorithms.searching

import SaddlebackSearch._
import org.specs2.mutable.Specification

class SaddlebackSearchSpec extends Specification {
  "Saddleback Search" should {
    val grid: Array[Array[Int]] = Array(
      Array(0, 1, 2),
      Array(4, 7, 9),
      Array(10, 12, 18)
    )

    "return true when value exists in matrix" in {
      SaddlebackSearch.saddleback_search(grid, 0)  mustEqual true
      SaddlebackSearch.saddleback_search(grid, 1)  mustEqual true
      SaddlebackSearch.saddleback_search(grid, 2)  mustEqual true
      SaddlebackSearch.saddleback_search(grid, 4)  mustEqual true
      SaddlebackSearch.saddleback_search(grid, 7)  mustEqual true
      SaddlebackSearch.saddleback_search(grid, 9)  mustEqual true
      SaddlebackSearch.saddleback_search(grid, 10) mustEqual true
      SaddlebackSearch.saddleback_search(grid, 12) mustEqual true
      SaddlebackSearch.saddleback_search(grid, 18) mustEqual true
    }

    "return false when value does not exist in matrix" in {
      SaddlebackSearch.saddleback_search(grid, -1) mustEqual false
      SaddlebackSearch.saddleback_search(grid, 5)  mustEqual false
      SaddlebackSearch.saddleback_search(grid, 11) mustEqual false
      SaddlebackSearch.saddleback_search(grid, 14) mustEqual false
      SaddlebackSearch.saddleback_search(grid, 24) mustEqual false
    }
  }
}
