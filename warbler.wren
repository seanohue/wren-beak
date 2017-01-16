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

  describe(description, specs) {
    System.print("Describe: %(description)")
    specs.call()
  }

}