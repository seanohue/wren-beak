import "warbler" for Test
import "beak" for Beak

var beakTest = Test.new("Beak Library")

test.describe("Core list functions") {
  var testList = [1, 2, 3]

  test.assert(Beak.head(testlist), 1, "Head")
  test.assert(Beak.tail(testlist), 3, "Tail")

  test.assert(Beak.isEmpty(testlist), false, "isEmpty on non-empty")
  test.assert(Beak.isEmpty([]), true, "isEmpty on empty list")

  test.assert(Beak.cons(0, testlist), [0, 1, 2, 3], "cons")
}