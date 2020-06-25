//DAY2
import UIKit

var str = "Hello, playground"

//1.Arrays
//Arrays are collections of values that are stored as a single value.

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]

//2.Sets
/*
Sets are collections of values just like arrays, except they have two differences:

Items aren’t stored in any order; they are stored in what is effectively a random order.
No item can appear twice in a set; all items must be unique.
*/

let colors = Set(["red", "green", "blue"])

let colors2 = Set(["red", "green", "blue", "red", "blue"])

//3,Tuples
//Tuples allow you to store several values together in a single value
/*
 That might sound like arrays, but tuples are different:

 You can’t add or remove items from a tuple; they are fixed in size.
 You can’t change the type of items in a tuple; they always have the same types they were created with.
 You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
 Tuples are created by placing multiple items into parentheses, like this:
 */

var name = (first: "Taylor", last: "Swift")

name.0

name.first

//4.Arrays vs Sets vs Tuples

//If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

//If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
let set = Set(["aardvark", "astronaut", "azalea"])

//If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]



//5.Dictionaries
//Dictionaries are collections of values just like arrays, but rather than storing things with an integer position you can access them using anything you want.
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

heights["Taylor Swift"]
//When using type annotations, dictionaries are written in brackets with a colon between your identifier and value types. For example, [String: Double] and [String: String].

//6.Dictonary default values
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]

favoriteIceCream["Charlotte"]

favoriteIceCream["Charlotte", default: "Unknown"]


//7. Creating empty collections
//Arrays, sets, and dictionaries are called collections, because they collect values together in one place.
//to create an empty collection just write its type followed by opening and closing parentheses.

var teams = [String: String]()

teams["Paul"] = "Red"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
//var results = Array<Int>()

//8. Enumerations
//Enumerations – usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.

let result = "failure"

let result2 = "failed"
let result3 = "fail"
//All those three are different strings, so they mean different things. With enums we can define a Result type that can be either success or failure, This stops you from accidentally using different strings each time.
enum Result {
    case success
    case failure
}

let result4 = Result.failure

//9. Enum associated values
// enums can also store associated values attached to each case. This lets you attach additional information to your enums so they can represent more nuanced data.

enum Activity {
    case bored
    case running
    case talking
    case singing
}

enum Activity_redeclared {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity_redeclared.talking(topic: "football")

//10. Enum raw values

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

//enum Planet: Int {
//    case mercury = 1
//    case venus
//    case earth1
//    case mars
//}
//Now Swift will assign 1 to mercury and count upwards from there, meaning that earth is now the third planet.

//11.Complex types
/*
 -Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 -Arrays store items in the order you add them, and you access them using numerical positions.
 -Sets store items without any order, so you can’t access them using numerical positions.
 -Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 -Dictionaries store items according to a key, and you can read items using those keys.
 -Enums are a way of grouping related values so you can use them without spelling mistakes.
 -You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */

