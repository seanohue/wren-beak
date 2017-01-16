class Beak {
  constructor() {}

  // First or last item of list.
  static head(xs) { xs[0] }
  static tail(xs) { xs[1..-1] }

  // Is the list empty?
  static isEmpty(xs) { xs.count == 0 }
  
  // Append an item onto the front of a list.
  static cons(x, xs) { 
    var ys = this.copy(xs)
    ys.insert(0, x)
    return ys
  }

  // Returns a copy of a list.
  static copy(xs) { xs[0..-1] }

  // Not sure if I got the point of this one.
  static findNth(n, xs) { xs[n] }

  // Use a function that returns true or false to find an item in a list.
  static find(xs, predicate) {
    if (this.isEmpty(xs)) return null 
    return predicate.call(this.head(xs)) ? 
      this.head(xs) : 
      this.find(this.tail(xs), predicate)
  }

  static reverse(xs) { xs[-1..0] }

}
