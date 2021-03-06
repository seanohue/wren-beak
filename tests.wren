import "warbler" for Test
import "beak" for Beak

var beakTest = Test.new("Beak Library")

beakTest.describe("Core list functions") {
  var testList = [1, 2, 3]

  beakTest.assert(Beak.head(testList), 1, "Head")
  beakTest.assertListEqual(Beak.tail(testList), [2, 3], "Tail")

  beakTest.assert(Beak.isEmpty(testList), false, "isEmpty on non-empty")
  beakTest.assert(Beak.isEmpty([]), true, "isEmpty on empty list")

  beakTest.assert(Beak.findNth(33, []), null, "Safely finds nth of list without out of bounds error")

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

  beakTest.assertListEqual(Beak.reverse(testList), reversed, "Reversing a list")
  beakTest.assertListEqual(Beak.reverse([]), [], "Reversing empty list")

  var a = [1, 3]
  var b = [2, 4]

  beakTest.assertListEqual(Beak.concat(a, b), [1, 3, 2, 4], "Concatenating two lists")
  beakTest.assertListEqual(Beak.concat([], []), [], "Concatenating empty lists")
}

beakTest.describe("Higher order functions") {
  var testList = [1, 2, 3]

  var mapped = Beak.reduce(testList, []) { |x, acc|
    var y = x + 1
    return Beak.append(y, acc)
  }

  var mapped2 = Beak.map(testList) { |x| x + 1 }

  beakTest.assertListEqual(mapped, [2, 3, 4], "Reduce")
  beakTest.assertListEqual(mapped2, [2, 3, 4], "Map")

  var filtered = Beak.filter(testList) { |x| (x % 2) == 0 }
  beakTest.assertListEqual(filtered, [2], "Filter")

  var iterated = Beak.iter(10, 0) { |x| x + 1 }
  beakTest.assert(iterated, 10, "Function iteration")

  var addOne = Fn.new { |x| x + 1 }
  var timesThree = Fn.new { |x| x * 3 }
  var composed = Beak.compose([addOne, timesThree], 2)
  beakTest.assert(composed, 9, "Function composition")

  var partiallyComposed = Beak.compose([addOne, timesThree])
  var fullyComposed = partiallyComposed.call(4)
  beakTest.assert(fullyComposed, 15, "Partially applied function composition")

  var toTakeFrom = [1, 2, 3, 4]
  var takenFrom = Beak.take(2, toTakeFrom)
  beakTest.assertListEqual(takenFrom, [1, 2], "Taking elements from list")

  var takeNegative = Beak.take(-3, toTakeFrom)
  beakTest.assertListEqual(takeNegative, [], "Taking negative elements from list")

  var takeTooMuch = Beak.take(100, toTakeFrom)
  beakTest.assertListEqual(takeTooMuch, toTakeFrom, "Taking more elements from list than are present")
}