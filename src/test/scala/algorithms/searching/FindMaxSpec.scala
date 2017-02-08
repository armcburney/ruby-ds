/**
  * FindMaxSpec.scala
  *
  * @author: Andrew McBurney
  * @note:   Test harness for FindMaximum.scala
  */

package algorithms.searching

import FindMaximum._
import org.specs2.mutable.Specification

class FindMaxSpec extends Specification {
  "Find Max" should {
    val array = Array[Int](0, -1, 8, 3, -2, 4, -5)
    val array2 = Array[Int](0)
    val array3 = Array[Int]()

    "find maximum value in an array with iteration" in {
      FindMaximum.find_max(array, array.length)   mustEqual Some(8)
      FindMaximum.find_max(array2, array2.length) mustEqual Some(0)
      FindMaximum.find_max(array3, array3.length) mustEqual None
    }

    "find maximum value in an array recursively" in {
      FindMaximum.find_max_recursive(array)  mustEqual Some(8)
      FindMaximum.find_max_recursive(array2) mustEqual Some(0)
      FindMaximum.find_max_recursive(array3) mustEqual None
    }
  }
}
