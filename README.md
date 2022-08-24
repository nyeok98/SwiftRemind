# Swift Remind
Swift 5.6 부분 발췌




## Collection에서 `remove(at:)` 의 반환
Similarly, you remove an item from the array with the `remove(at:)` method. This method removes the item at the specified index and returns the removed item (although you can ignore the returned value if you don’t need it)

```
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string.
```


## Dictionary에서 축약형의 선언 및 데이터 업데이트
A dictionary	key type must conform to the Hashable protocol, like a set’s value type. *the shorthand form is preffered*
```
var namesOfInteger: [Int: String] = [:]
// in this case namesOfInteger is an empty [Int:Stirng] dictionary
```

The `updateValue(_:forKey:)` method return the old value after performing an update.

```
if let oldValue = airport.updateValue("Dublin Airport", forKey: "DUB") {
		print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."
```

You	can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of `nil` for that key:
```
airports["APL"] = "Apple International"
// "Apple International" isn't the real airport for APL, so delete it airports["APL"] = nil
// APL has now been removed from the dictionary
```

Alternatively, remove a key-value pair from a dictionary with the `removeValue(forKey:)` method. This method removes the key-value pair if it exists and returns the removed value, or returns `nil` if no value exited:
```
if let removedValue = airports.removeValue(forKey: "DUB") {
		print("The removed airport's name is \(removedValue).")
} else {
		print("The airports dictionary doesn't contain a value 		for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."
```



## Dictionary에서 key-value의 Array치환
If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:
```
let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]
```



## Switch문에서 튜플의 활용
The example below takes and (x, y) point, expressed as a simple tuple of type (Int, Int), and categorizes it on the graph that follows the example.
```
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
		print("\(somePoint) is at the origin")
case (_, 0):
		print("\(somePoint) is on the x-axis")
case (0, _):
		print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
		print("\(somePoint) is inside the box")
default:
		print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"
```



## Switch문에서 Value Bindings
A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as *value binding*, because the values are bound to temporary constants or variables within the case’s body.
```
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
		print("on the x-axis with an x value of \(x)")
case (0, let y):
		print("on the y-axis with an y value of \(y)")
case let (x, y):
		print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"
```
