import Foundation

class Node<T> {
  
  var data: T
  var next: Node?
  
  init(data: T, next: Node? = nil){
    self.data = data
    self.next = next
  }
}

class LinkList<T>: CustomStringConvertible where T: Comparable, T: CustomStringConvertible {
  private var startNode: Node<T>?
  
  var isEmpty: Bool {
    return self.startNode == nil
  }
  
  //MARK: Appending from last
  func append(element: T){
    let item = Node(data: element)
    if var node = self.startNode {
      while(node.next != nil){
        node = node.next!
      }
      node.next = item
    }
    else {
      self.startNode = item
    }
  }
  
  //MARK: Insert node at beginning
  func insert(element: T){
    let item = Node(data: element)
    item.next = self.startNode
    self.startNode = item
  }
  
  //MARK: Insert node at particular position
  func insert(position: Int, element: T){
    if position == 0 {
      self.insert(element: element)
    }
    else {
      let item = Node(data: element)
      var nextNode = self.startNode
      var previousNode: Node<T>?
      
      for _ in 0..<position {
        previousNode = nextNode
        nextNode = nextNode?.next
      }
      
      previousNode?.next = item
      item.next = nextNode
    }
  }
  
  //MARK: Remove Node from begining
  func removeFirst(){
    self.startNode = self.startNode?.next
  }
  
  //MARK: Remove node from end
  func removeLast(){
    var nextNode = self.startNode
    var previousNode: Node<T>?
    while(nextNode?.next != nil ){
      previousNode = nextNode
      nextNode = nextNode?.next
    }
    
    previousNode?.next = nil
  }
  
  //MARK: REMOVE NODE AT PARTICULAR POSITION
  func remove(at position: Int){
    if position == 0 {
      self.removeFirst()
    }
    else {
      var nextNode = self.startNode
      var previousNode: Node<T>?
      for _ in 0..<position {
        previousNode = nextNode
        nextNode = nextNode?.next
      }
      previousNode?.next = nextNode?.next
    }
  }
  
  //MARK: Search a particular node
  func search(element: T) -> Int {
    var node = self.startNode
    var count = 0
    while(node != nil){
      if node?.data == element {
        return count
      }
      count += 1
      node = node?.next
    }
    return count
  }
  
  var description: String {
    var data = ""
    let top = "### LINK LIST ###\n"
    let bottom = "################\n"
    var node = self.startNode
    while(node != nil){
      data += (node?.data.description)! + "\n"
      node = node?.next
    }
    return top + data + bottom
  }
}


let linkList =  LinkList<Int>()
for n in 0...5{
  linkList.append(element: n)
}
print(linkList.description)
linkList.insert(element: 100)
print(linkList.description)
linkList.insert(position: 4, element: 1000)
print(linkList.description)
print(linkList.search(element: 2))
print(linkList.description)
linkList.removeFirst()
print(linkList.description)
linkList.removeLast()
print(linkList.description)
linkList.remove(at: 2)
print(linkList.description)

/* OUTPUT */

/*
 
 ### LINK LIST ###
 0
 1
 2
 3
 4
 5
 ################
 ### LINK LIST ###
 100
 0
 1
 2
 3
 4
 5
 ################
 ### LINK LIST ###
 100
 0
 1
 2
 1000
 3
 4
 5
 ################
 3
 ### LINK LIST ###
 100
 0
 1
 2
 1000
 3
 4
 5
 ################
 ### LINK LIST ###
 0
 1
 2
 1000
 3
 4
 5
 ################
 ### LINK LIST ###
 0
 1
 2
 1000
 3
 4
 ################
 ### LINK LIST ###
 0
 1
 1000
 3
 4
 ################
 
 
 */
