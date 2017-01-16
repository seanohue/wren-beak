import "warbler" for Test
import "beak" for Beak

var beakTest = Test.new("Beak Library")

beakTest.describe("Core list functions") {
  var testList = [1, 2, 3]

  beakTest.assert(Beak.head(testlist), 1, "Head")
  beakTest.assert(Beak.tail(testlist), 3, "Tail")

  beakTest.assert(Beak.isEmpty(testlist), false, "isEmpty on non-empty")
  beakTest.assert(Beak.isEmpty([]), true, "isEmpty on empty list")

  beakTest.assert(Beak.cons(0, testlist), [0, 1, 2, 3], "cons")
}