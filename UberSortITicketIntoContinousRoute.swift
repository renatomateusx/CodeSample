import Foundation

let array = [
["SFO", "EWR"],
["SJC", "LAX"],
["DFW", "SJC"],
["EWR", "OAK"],
["LAX", "SFO"]
]

var dic: [String: String] = [:]
var finalArray = [String]()
var currentKey:String?

for item in array {
    let key = item[0]
    let value = item[1]
    dic[key] = value
}

let values = dic.values
for item in dic.keys {
    if !values.contains(item) {
        finalArray.append(item)
        currentKey = item
        break
    } 
}

while(currentKey != nil) {
    if let value = dic[currentKey!]{
        currentKey = value
        finalArray.append(value)
    } else {
        break
    }
}
