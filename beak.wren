class Beak {
  constructor() {}

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
    var ys = this.copy(xs)
    ys.insert(0, x)
    return ys
  }

  // Append an item to the end of a list
  static append(x, xs) {
    var ys = this.copy(xs)
    ys.insert(-1, x)
    return ys
  }

  // Returns a copy of a list.
  static copy(xs) { xs[0..-1] }

  // Recursively and safely searches a list for the nth index.
  static findNth(n, xs) {
    if (n < 1) {
      return this.head(xs)
    }
    return this.isEmpty(this.tail(xs)) ?
      null :
      this.findNth(n - 1, this.tail(xs))
  }

  // Use a function that returns true or false to find an item in a list.
  static find(xs, predicate) {
    if (this.isEmpty(xs)) return null
    return predicate.call(this.head(xs)) ?
      this.head(xs) :
      this.find(this.tail(xs), predicate)
  }

  // Reduce/fold a list into an accumulator.
  static reduce(xs, acc, fn) {
    if (this.isEmpty(xs)) {
      return acc
    }
    var newXs = this.tail(xs)
    var newAcc = fn.call(this.head(xs), acc)
    return this.reduce(newXs, newAcc, fn)
  }

  // Map over a list, implemented using reduce.
  static map(xs, fn) {
    return this.reduce(xs, []) { |x, acc| this.append(fn.call(x), acc) }
  }

  // Filter items from a list
  static filter(xs, predicate) {
    return this.reduce(xs, []) { |x, acc| predicate.call(x) ? this.append(x, acc) : acc }
  }

  // Reverse a list, implemented using reduce.
  static reverse(xs) {
    return this.reduce(xs, []) { |x, acc| this.cons(x, acc) }
  }

  // Concatenate two lists.
  static concat(xs, ys) {
    return this.reduce(ys, this.copy(xs)) { |y, acc| this.append(y, acc) }
  }

  // Recursively iterates over x, calling fn on it n number of times.
  static iter(n, x, fn) {
    return n > 1 ?
      this.iter(n - 1, fn.call(x), fn) :
      fn.call(x)
  }

  // Pass a list of functions and a single data point to run them on.
  static compose(fns, x) {
    return this.reduce(fns, x) { |fn, x| fn.call(x) }
  }

  // Pass a list of functions, and get a lambda that can take a single param.
  static compose(fns) {
    return Fn.new { |x| this.compose(fns, x) }
  }

}
