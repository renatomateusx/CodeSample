import Foundation

let arrayOne = [1, 2, 3, 4, 5, 6, 200, 400, 600]
let arrayTwo = [3, 6, 9, 12, 15, 18, 21, 24, 999]
let arrayThree = [2, 4, 6, 8, 10, 12, 14, 16, 18, 800]
let arrayNames = ["Renato", nil, "Mateus", nil, "Moura", nil, "Santos", nil]

// Filter
let array = arrayOne.filter({  $0 % 2 == 0 })
// print(array)

// Map
let arrayMap = arrayOne.map({ $0 > 10 })
// print(arrayMap)

// FilterMap
let filterMap = arrayThree.filter { $0 % 2 == 0 }.map{ $0 * $0 }
// print(filterMap)

// FilterMap
let filterMap2 = arrayThree.filter { $0 > 10 }.map{ $0 * $0 }
// print(filterMap2)

// Filter
let arrayFilter = arrayOne.filter({  $0 > 10 })
// print(arrayFilter)


// Reduce
let arrayReduce = arrayOne.reduce(0) { $0 + $1 }
// print(arrayReduce)

// Filter + Reduce
let filterReduce = arrayTwo.filter { $0 >= 24 }.reduce(0, +)
// print(filterReduce)

// FlatMap
let allResults = [arrayOne, arrayTwo, arrayThree].flatMap { $0 } 
// print(allResults)

// FlatMap2
let allResults2 = [arrayOne, arrayTwo, arrayThree].flatMap { $0.filter { $0 > 100 } } 
// print(allResults2)

// CompactMap
let compactResult = arrayNames.compactMap { $0 } 
print(compactResult) 
