import Foundation

// MARK: Function

func returnSomeValue(completion: () -> Void) {
    completion()
}

// Running
let semaphore = DispatchSemaphore(value: 0)

returnSomeValue { 
  print(1)
  semaphore.signal() 
}
semaphore.wait()

returnSomeValue { 
  print(2)
  semaphore.signal() 
}
semaphore.wait()

returnSomeValue { 
  print(3)
  semaphore.signal() 
}
semaphore.wait()

print("All functions are completed")
