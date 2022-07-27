import Foundation

// MARK: Function

func returnSomeValue(completion: () -> Void) {
    completion()
}

// Running
let dispatchGroup = DispatchGroup()

dispatchGroup.enter()
returnSomeValue { 
  print(1)
  dispatchGroup.leave() 
}

dispatchGroup.enter()
returnSomeValue { 
  print(2)
  dispatchGroup.leave() 
}

dispatchGroup.enter()
returnSomeValue { 
  print(3)
  dispatchGroup.leave() 
}

dispatchGroup.notify(queue: .main) {
    print("All functions are completed")
}
