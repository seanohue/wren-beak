import "warbler" for Test
import "beak" for Beak

var beakTest = Test.new("Beak Library")

beakTest.describe("Core list functions") {
  var testList = [1, 2, 3]

  beakTest.assert(Beak.head(testList), 1, "Head")
  beakTest.assertListEqual(Beak.tail(testList), [2, 3], "Tail")

  beakTest.assert(Beak.isEmpty(testList), false, "isEmpty on non-empty")
  beakTest.assert(Beak.isEmpty([]), true, "isEmpty on empty list")

  beakTest.assertListEqual(Beak.cons(0, testList), [0, 1, 2, 3], "cons")
}

beakTest.describe("List searching functions") {
  var testList = [1, "33", "potato"]
  var found = Beak.find(testList) { |x| x == "33" }
  beakTest.assert(found, "33", "Finding an item in a list")

  var notFound = Beak.find(testList) { |x| x == "derp" }
  beakTest.assert(notFound, null, "Failing to find a nonexistent item")
}

beakTest.describe("List manipulation functions") {
  var testList = [1, 2, 3]
  var reversed = [3, 2, 1]

  var mapped = Beak.reduce(testList, []) { |x, acc|
    var y = x + 1
    return Beak.cons(y, acc)
  }

  beakTest.assertListEqual(mapped, [2, 3, 4], "Reduce higher-order function")

  beakTest.assertListEqual(Beak.reverse(testList), reversed, "Reversing a list")
  beakTest.assertListEqual(Beak.reverse([]), [], "Reversing empty list")
}

beakTest.describe("Higher order functions") {
  var testList = [1, 2, 3]

  var mapped = Beak.reduce(testList, []) { |x, acc|
    var y = x + 1
    return Beak.append(y, acc)
  }

  beakTest.assertListEqual(mapped, [2, 3, 4], "Reduce")

}