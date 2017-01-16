class Beak {
  constructor() {}

  static head(xs) { xs[0] }
  static tail(xs) { xs[-1] }

  static isEmpty(xs) { xs.count == 0 }
  
  static cons(x, xs) { 
    var ys = xs[0..-1]
    ys.insert(0, x)
    return ys
  }
}

var testlist = [1, 2, 3]
var emptylist = []

System.print(Beak.head(testlist)) // expect 1
System.print(Beak.tail(testlist)) // expect 3
System.print(Beak.isEmpty(testlist)) // expect false
System.print(Beak.isEmpty(emptylist)) // expect true
System.print(Beak.cons(0, testlist)) // expect [0, 1, 2, 3]

/*
const head = (xs) => xs[0];
const tail = (xs) => xs.slice(1);
const isEmpty = (xs) => xs.length === 0;
const cons = (x, xs) => {
    const ys = Array.from(xs);
    ys.unshift(x);
    return ys;
};
*/