class Stack<T> {
    private var elements: [T] = []
    
    func push(_ element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        return elements.popLast()
    }
    
    func size() -> Int {
        return elements.count
    }
    
    func printStackContents() -> String {
        return "Stack: \(elements)"
    }
}
/*
 let intStack = Stack<Int>()
 
 intStack.push(10)
 intStack.push(20)
 intStack.push(30)
 
 print(intStack.printStackContents())
 
 if let poppedValue = intStack.pop() {
 print("Popped value: \(poppedValue)")
 }
 
 print("Stack size: \(intStack.size())")
 
 print(intStack.printStackContents())
 */
