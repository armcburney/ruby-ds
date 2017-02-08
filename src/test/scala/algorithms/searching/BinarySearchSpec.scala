/**
  * BinarySearchSpec.scala
  *
  * @author: Andrew McBurney
  * @note:   Test harness for BinarySearch.scala
  */

package algorithms.searching

import BinarySearch._
import org.specs2.mutable.Specification

class BinarySearchSpec extends Specification {
  "Binary Search" should {
    val array = Array[Int](0, 4, 8, 21, 29, 41, 50)
    val array2 = Array[Int]()

    "return true when value exists in array" in {
      BinarySearch.binary_search(array, 0)  mustEqual true
      BinarySearch.binary_search(array, 4)  mustEqual true
      BinarySearch.binary_search(array, 8)  mustEqual true
      BinarySearch.binary_search(array, 21) mustEqual true
      BinarySearch.binary_search(array, 29) mustEqual true
      BinarySearch.binary_search(array, 41) mustEqual true
      BinarySearch.binary_search(array, 50) mustEqual true
    }

    "return false when value does not exist in array" in {
      BinarySearch.binary_search(array, 2)  mustEqual false
      BinarySearch.binary_search(array, 27) mustEqual false
      BinarySearch.binary_search(array, 53) mustEqual false
    }
  }
}
