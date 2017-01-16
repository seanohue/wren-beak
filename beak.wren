class Beak {
  constructor() {}

  // First or last item of list.
  static head(xs) { xs[0] }
  static tail(xs) { xs[-1] }

  // Is the list empty?
  static isEmpty(xs) { xs.count == 0 }
  
  // Append an item onto the front of a list.
  static cons(x, xs) { 
    var ys = xs[0..-1]
    ys.insert(0, x)
    return ys
  }

}
