//DAY8
//Structs - i
//structs, properties, and methods

import UIKit


//Creating your own structs
/*
 Swift lets you design your own types in two ways, of which the most common are called structures, or just structs. Structs can be given their own variables and constants, and their own functions, then created and used however you want.
*/

//we’re going to create a Sport struct that stores its name as a string. Variables inside structs are called properties, so this is a struct with one property:
struct Sport {
    var name: String
}

//That defines the type, so now we can create and use an instance of it:
var tennis = Sport(name: "Tennis")
print(tennis.name)

//We made both name and tennis variable, so we can change them just like regular variables:
tennis.name = "Lawn Tennis"

//Properties can have default values just like regular variables, and you can usually rely on Swift’s type inference.

//--------------------------------------------------------------------------------------------------------

//Computed properties
/*
 from above created sport struct
 That has a name property that stores a String. These are called stored properties, because Swift has a different kind of property called a computed property – a property that runs code to figure out its value.

 We’re going to add another stored property to the Sport struct, then a computed property. Here’s how that looks:
 */
struct Sport_1 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
/*
 As you can see, olympicStatus looks like a regular String, but it returns different values depending on the other properties.

 We can try it out by creating a new instance of Sport_1:
 */

let chessBoxing = Sport_1(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//--------------------------------------------------------------------------------------------------------

//Property observers
/*
 Property observers let you run code before or after any property changes. To demonstrate this, we’ll write a Progress struct that tracks a task and a completion percentage:
 */

//struct Progress {
//    var task : String
//    var amount : Int
//}

//We can now create an instance of that struct and adjust its progress over time:
//var progress = Progress(task: "Loading data", amount: 0)
//progress.amount = 25
//progress.amount = 50
//progress.amount = 89

//What we want to happen is for Swift to print a message every time amount changes, and we can use a didSet property observer for that. This will run some code every time amount changes:
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 25
progress.amount = 50
progress.amount = 89
//You can also use willSet to take action before a property changes, but that is rarely used.

//--------------------------------------------------------------------------------------------------------

//Methods
//Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword.
/*
 We can demonstrate this with a City struct. This will have a population property that stores how many people are in the city, plus a collectTaxes() method that returns the population count multiplied by 1000. Because the method belongs to City it can read the current city’s population property.
 */
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

//That method belongs to the struct, so we call it on instances of the struct like this:

let Monaco = City(population: 40_000)
Monaco.collectTaxes()

//--------------------------------------------------------------------------------------------------------

//Mutating methods
/*
 If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.

 The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift won’t let you write methods that change properties unless you specifically request it.

 When you want to change a property inside a method, you need to mark it using the mutating keyword, like this:
 */

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

//Because it changes the property, Swift will only allow that method to be called on Person instances that are variables:
var person = Person(name: "Ed")
print(person.makeAnonymous())

//--------------------------------------------------------------------------------------------------------

//Properties and methods of strings

//We’ve used lots of strings so far, and it turns out they are structs – they have their own methods and properties we can use to query and manipulate the string.
let string = "Do or do not, there is no try."

//You can read the number of characters in a string using its count property:
print(string.count)

//They have a hasPrefix() method that returns true if the string starts with specific letters:
print(string.hasPrefix("Do"))

//You can uppercase a string by calling its uppercased() method:
print(string.uppercased())

//And you can even have Swift sort the letters of the string into an array:
print(string.sorted())

//note :Strings have lots more properties and methods – try typing string. to bring up Xcode’s code completion options.

//--------------------------------------------------------------------------------------------------------

//Properties and methods of arrays
//Arrays are also structs, which means they too have their own methods and properties we can use to query and manipulate the array.

var toys = ["Woody"]

//TO read the number of items in an array using its count property:
print(toys.count)

//If you want to add a new item, use the append() method like this:
toys.append("Buzz")

//You can locate any item inside an array using its firstIndex() method, like this:
toys.firstIndex(of: "Buzz") //That will return 1 because arrays count from 0.

//Just like with strings, you can have Swift sort the items of the array alphabetically:
print(toys.sorted())

//Finally, if you want to remove an item, use the remove() method like this:
toys.remove(at: 0)

//note: Arrays have lots more properties and methods






