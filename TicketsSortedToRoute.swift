
/*.  IMPROVED  .*/

var currentKey:String = ""
var currentValue: String = ""
let array = [
            ["SFO", "EWR"],
            ["SJC", "LAX"],
            ["DFW", "SJC"],
            ["EWR", "OAK"],
            ["LAX", "SFO"],
            ]
var dic:[String:String] = [:]
for item in array { 
    dic[item[0]] = item[1]
}
let values = dic.values
let keys = dic.keys
for item in values {
  if (!keys.contains(item)) {
      currentValue = item
      break
  }
}

var actualValue: String? = currentValue
var arrayFinal = [String]()
arrayFinal.append(currentValue)
while(actualValue != nil) {
    let itemDic = dic.filter({ $0.value == actualValue  } )
    if itemDic.keys.count > 0 {
        arrayFinal.append(itemDic.keys.first!)
        actualValue = itemDic.keys.first!
    } else {
        break
    }
}
let reversed = Array(arrayFinal.reversed())
print(reversed)


/*.  ORIGINAL  .*/

import Foundation

import Foundation
var currentKey:String = ""
var currentValue: String = ""
let array = [
            ["SFO", "EWR"],
            ["SJC", "LAX"],
            ["DFW", "SJC"],
            ["EWR", "OAK"],
            ["LAX", "SFO"],
            ]
var dic:[String:String] = [:]
for item in array { 
    dic[item[0]] = item[1]
}
let values = dic.values
let keys = dic.keys
// print(values)
// print(keys)
for item in values {
    // print(keys.first(where: { $0.contains(item) }))
    if keys.first(where: { $0.contains(item) }) == nil {
        currentValue = item
    }
}

// for item in keys { 
//     if values.first(where: { $0.contains(item) }) == nil {
//         currentKey = item
//     }
// }

// print(currentValue)
// print(currentKey)

var actualValue: String? = currentValue
var arrayFinal = [String]()
arrayFinal.append(currentValue)
while(actualValue != nil) {
    let itemDic = dic.filter({ $0.value == actualValue  } )
    if itemDic.keys.count > 0 {
        arrayFinal.append(itemDic.keys.first!)
        actualValue = itemDic.keys.first!
    } else {
        actualValue = nil
    }
}
let reversed = Array(arrayFinal.reversed())
print(reversed)
