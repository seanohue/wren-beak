class Beak {
  constructor() {}

  // First or last item of list.
  static head(xs) { 
    return isEmpty(xs) ? 
      [] : 
      xs[0] 
  }
  
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
    var reduced = this.reduce(newXs, newAcc, fn)
    return reduced
  }

  // Map over a list, implemented using reduce.
  static map(xs, fn) {
    var mapped = this.reduce(xs, []) { |x, acc| this.append(fn.call(x), acc) }
    return mapped
  }

  // Reverse a list, implemented using reduce.
  static reverse(xs) { 
    return this.reduce(xs, []) { |x, acc| this.cons(x, acc) }
  }

  // Concatenate two lists.
  static concat(xs, ys) { 
    return this.reduce(ys, this.copy(xs)) { |y, acc| this.append(y, acc) }
  }

}
