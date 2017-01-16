/*
 From https://github.com/seanohue/wren-warbler
*/
class Test {

  construct new(unitTitle) {
    System.print("Testing %(unitTitle).")
    _title = unitTitle
  }
  
  assert { true }
  
  assert(actual, expected) {
    if (actual != expected) {
      System.print("FAIL: %(actual) was not %(expected) in %(_title).")
    } else {
      System.print("GREAT SUCCESS")
    }
  }

  assert(actual, expected, message) {
    if (actual != expected) {
      System.print("FAIL: %(message)")
    } else {
      System.print("GREAT SUCCESS: %(message)")
    }
  }

  assertListEqual(xs, ys, message) {
    var equal = true
    var i = 0

    if (xs.count != ys.count) {
      System.print("FAIL: %(xs) and %(ys) are not equal or even the same length after %(message)!")
      return false
    }

    while (equal && i < xs.count) {
      if (xs[i] != ys[i]) {
        equal = false
      }

      i = i + 1
    }

    if (equal) {
      System.print("GREAT SUCCESS: %(message)")
    } else {
      System.print("FAIL: %(xs) does not equal %(ys). %(message)")
    }
  }

  describe(description, specs) {
    System.print("Describe: %(description)")
    specs.call()
  }

}