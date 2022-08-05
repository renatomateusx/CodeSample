import Foundation

// Merge Intervals
// O(nlogn)
// Space: O(n)

//Input [[1,3], [2,6], [15,18], [8,10], [21,35]]
//Output [[1,6], [8,10], [15,18], [21,35]]

func mergeIntervals(_ input: [[Int]]) -> [[Int]] {
  guard input.count > 1 else {
    return input
  }

  // nlogn
  let sortedInput = input.sorted(by: { item1, item2 in 
    return item1[0] < item2[0] 
  })

  var result = [[Int]]()
  result.reserveCapacity(input.count)

  result.append(sortedInput[0])

  //n
  for i in 1..<sortedInput.count {
    let current = sortedInput[i]
    let lastInterval = result.last!

    if current[0] >= lastInterval[0] && current[0] <= lastInterval[1] {
      // change last interval
      _ = result.removeLast()
      result.append([
        min(current[0], lastInterval[0]),
        max(current[1], lastInterval[1])
      ])
    } else {
      result.append(current)
    }
  }

  return result
}

let input = [[1,3], [2,6], [15,18], [8,10], [21,35], [45, 50], [19, 22]]

let result = mergeIntervals(input)
print(result)
