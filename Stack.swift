import Foundation

class Stack<T: CustomStringConvertible>: CustomStringConvertible {
  private var array: [T] = []
  
  func pop() -> T? {
    let popItem = self.array.popLast()
    print("POP ITEM: \(popItem?.description ?? "")")
    return popItem
  }
  
  func peak() -> T? {
    if self.array.isEmpty {return nil}
    return self.array[self.array.count - 1]
  }
  
  func push(item: T) {
    print("PUSHED ITEM : \(item.description)")
    self.array.append(item)
  }
  
  var isEmpty: Bool {
    return self.array.isEmpty
  }
  
  var count: Int {
    return self.array.count
  }
  
  var description: String {
    let top = "### STACK ###\n"
    let bottom = "\n###########\n"
    let elements = self.array.reversed().map { $0.description }.joined(separator: "\n")
    return top + elements + bottom
  }
  
}

let obj = Stack<String>()

obj.push(item: "A")
obj.push(item: "B")
obj.push(item: "C")
obj.push(item: "D")
obj.push(item: "E")

print("STACK COUNT: \(obj.count)")
print(obj.description)
let _ = obj.pop()
print(obj.description)
let _ = obj.pop()
print("STACK COUNT: \(obj.count)")
print(obj.description)

/*OUTPUT*/
/*
PUSHED ITEM : A
PUSHED ITEM : B
PUSHED ITEM : C
PUSHED ITEM : D
PUSHED ITEM : E
STACK COUNT: 5
### STACK ###
E
D
C
B
A
###########
POP ITEM: E
### STACK ###
D
C
B
A
###########
POP ITEM: D
STACK COUNT: 3
### STACK ###
C
B
A
###########
*/



let obj2 = Stack<Int>()
for n in 1...10 {
  obj2.push(item: n)
}

print("STACK COUNT: \(obj2.count)")
print(obj2.description)
let _ = obj2.pop()
print(obj2.description)
let _ = obj2.pop()
print("STACK COUNT: \(obj2.count)")
print(obj2.description)

/*OUTPUT*/

/*
 
 PUSHED ITEM : 1
 PUSHED ITEM : 2
 PUSHED ITEM : 3
 PUSHED ITEM : 4
 PUSHED ITEM : 5
 PUSHED ITEM : 6
 PUSHED ITEM : 7
 PUSHED ITEM : 8
 PUSHED ITEM : 9
 PUSHED ITEM : 10
 STACK COUNT: 10
 ### STACK ###
 10
 9
 8
 7
 6
 5
 4
 3
 2
 1
 ###########
 POP ITEM: 10
 ### STACK ###
 9
 8
 7
 6
 5
 4
 3
 2
 1
 ###########
 POP ITEM: 9
 STACK COUNT: 8
 ### STACK ###
 8
 7
 6
 5
 4
 3
 2
 1
 ###########
 
 */
