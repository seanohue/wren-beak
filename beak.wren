class Beak {

  // First item of list.
  static head(xs) {
    return isEmpty(xs) ?
      [] :
      xs[0]
  }

  // Rest of list after first item.
  static tail(xs) {
    return isEmpty(xs) ?
      [] :
      xs[1..-1]
  }

  // Is the list empty?
  static isEmpty(xs) { xs.count == 0 }

  // Append an item onto the front of a list.
  static cons(x, xs) {
    var ys = copy(xs)
    ys.insert(0, x)
    return ys
  }

  // Append an item to the end of a list
  static append(x, xs) {
    var ys = copy(xs)
    ys.insert(-1, x)
    return ys
  }

  // Returns a copy of a list.
  static copy(xs) { xs[0..-1] }

  // Recursively and safely searches a list for the nth index.
  static findNth(n, xs) {
    if (n < 1) {
      return head(xs)
    }
    return isEmpty(tail(xs)) ?
      null :
      findNth(n - 1, tail(xs))
  }

  // Use a function that returns true or false to find an item in a list.
  static find(xs, predicate) {
    if (isEmpty(xs)) return null
    return predicate.call(head(xs)) ?
      head(xs) :
      find(tail(xs), predicate)
  }

  // Reduce/fold a list into an accumulator.
  static reduce(xs, acc, fn) {
    if (isEmpty(xs)) {
      return acc
    }
    var newXs = tail(xs)
    var newAcc = fn.call(head(xs), acc)
    return reduce(newXs, newAcc, fn)
  }

  // Map over a list, implemented using reduce.
  static map(xs, fn) {
    return reduce(xs, []) { |x, acc| append(fn.call(x), acc) }
  }

  // Filter items from a list
  static filter(xs, predicate) {
    return reduce(xs, []) { |x, acc| predicate.call(x) ? append(x, acc) : acc }
  }

  // Reverse a list, implemented using reduce.
  static reverse(xs) {
    return reduce(xs, []) { |x, acc| cons(x, acc) }
  }

  // Concatenate two lists.
  static concat(xs, ys) {
    return reduce(ys, copy(xs)) { |y, acc| append(y, acc) }
  }

  // Recursively iterates over x, calling fn on it n number of times.
  static iter(n, x, fn) {
    return n > 1 ?
      iter(n - 1, fn.call(x), fn) :
      fn.call(x)
  }

  // Pass a list of functions and a single data point to run them on.
  static compose(fns, x) {
    return reduce(fns, x) { |fn, x| fn.call(x) }
  }

  // Pass a list of functions, and get a lambda that can take a single param.
  static compose(fns) {
    return Fn.new { |x| compose(fns, x) }
  }

  static take(n, xs) {
    var taken = n > xs.count ?
      (xs.count - 1) :
      (n - 1)

    return taken < 0 ?
      [] :
      xs[0..taken]
  }

}
