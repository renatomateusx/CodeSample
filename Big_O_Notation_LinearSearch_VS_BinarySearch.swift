import Foundation

func binarySearch<T: Comparable>(_ inputArr: Array<T>, 
                                 _ searchItem: T) -> [Int: Int]? {

  var lowerIndex = 0
  var upperIndex = inputArr.count - 1
  var bigO = 0

  while (true) { 
    bigO += 1
    let currentIndex = (lowerIndex + upperIndex) / 2
    if inputArr[currentIndex] == searchItem {
      return [currentIndex: bigO]
    } else if lowerIndex > upperIndex {
      return nil
    } else {
      if inputArr[currentIndex] > searchItem {
        upperIndex = currentIndex - 1
      } else {
        lowerIndex = currentIndex + 1
      }
    }
  }
}


func linearSearch<T: Comparable>(_ inputArr: Array<T>, 
                                 _ searchItem: T) -> [Int: Int]?  {
    var bigO = 0                 
    for (index, _) in inputArr.enumerated() {
       bigO += 1
      if inputArr[index] == searchItem {
        return [index: bigO]
      }
    }
    return nil
}

var myArray = Array(1...100)
if let searchIndex = binarySearch(myArray, 100) {
  let index = Array(searchIndex.keys)[0]
  let bigO = Array(searchIndex.values)[0]
  print("Binary Search: Element found on index: \(index) and has the BigO of O(\(bigO))")
}

//Binary Search: Element found on index: 99 and has the BigO of O(7)

if let searchIndexLinear = linearSearch(myArray, 100) {
  let index = Array(searchIndexLinear.keys)[0]
  let bigO = Array(searchIndexLinear.values)[0]
  print("LINEAR: Element found on index: \(index) and has the BigO of O(\(bigO))")
}
//LINEAR: Element found on index: 99 and has the BigO of O(100)
