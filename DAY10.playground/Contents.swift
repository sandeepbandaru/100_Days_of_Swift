//DAY10
import UIKit

//Creating your own classes

/*
 Classes are similar to structs in that they allow you to create new types with properties and methods, but they have five important differences and I’m going to walk you through each of those differences one at a time.
 */

/*
 The first difference between classes and structs is that classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer.
 */

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//Creating instances of that class looks just the same as if it were a struct:
let poppy = Dog(name: "Poppy", breed: "Poodle")

//------------------------------------------------------------------------------------------

//Class inheritance
/*
 The second difference between classes and structs is that you can create a class based on an existing class – it inherits all the properties and methods of the original class, and can add its own on top.

 This is called class inheritance or subclassing, the class you inherit from is called the “parent” or “super” class, and the new class is called the “child” class.
 */

//using above Dog class
//We could create a new class based on that one called Poodle. It will inherit the same properties and initializer as Dog by default:

class Poodle: Dog {
 //However, we can also give Poodle its own initializer. We know it will always have the breed “Poodle”, so we can make a new initializer that only needs a name property. Even better, we can make the Poodle initializer call the Dog initializer directly so that all the same setup happens:
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

//For safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.

//------------------------------------------------------------------------------------------

//Overriding methods
//Child classes can replace parent methods with their own implementations – a process known as overriding. Here’s a trivial Dog class with a makeNoise() method:
class Dog1 {
    func makeNoise() {
        print("Woof!")
    }
}

//If we create a new Poodle class that inherits from Dog, it will inherit the makeNoise() method. So, this will print “Woof!”:

class Poodle1: Dog1 {
}

let poppy1 = Poodle1()
poppy1.makeNoise()

class Poodle2: Dog1 {
    override func makeNoise() {
        print("Yip!")
    }
}
//With that change, poppy.makeNoise() will print “Yip!” rather than “Woof!”.

//------------------------------------------------------------------------------------------

//Final classes
/*
 Although class inheritance is very useful – and in fact large parts of Apple’s platforms require you to use it – sometimes you want to disallow other developers from building their own class based on yours.

 Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.

 To make a class final just put the final keyword before it, like this:
 */
final class Cat {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//------------------------------------------------------------------------------------------


//Copying objects
/*
 The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
 */
// here’s a simple Singer class that has a name property with a default value:
class Singer {
    var name = "Taylor Swift"
}

//If we create an instance of that class and prints its name, we’ll get “Taylor Swift”:
var singer = Singer()
print(singer.name)

//Now let’s create a second variable from the first one and change its name:
var singerCopy = singer
singerCopy.name = "Weeknd"

//Because of the way classes work, both singer and singerCopy point to the same object in memory, so when we print the singer name again we’ll see “Justin Bieber”:
print(singer.name)

//On the other hand, if Singer were a struct then we would get “Taylor Swift” printed a second time:
struct Singer1 {
    var name = "Taylor Swift"
}

//------------------------------------------------------------------------------------------


//Deinitilizers

//------------------------------------------------------------------------------------------


//Mutability

//------------------------------------------------------------------------------------------


//Classes summary

