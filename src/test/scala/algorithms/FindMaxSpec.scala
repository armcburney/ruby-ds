/**
  * FindMaxSpec.scala
  *
  * @author: Andrew McBurney
  * @fileoverview:
  */

package algorithms

import FindMaximum._
import org.specs2.mutable.Specification

class FindMaxSpec extends Specification {
  "Find Max" should {
    val array = Array(0, -1, 8, 3, -2, 4, -5)

    "find maximum value in an array with iteration" in {
      FindMaximum.find_max(array, array.length) mustEqual 8
    }

    "find maximum value in an array recursively" in {
      FindMaximum.find_max_recursive(array) mustEqual 8
    }
  }
}
