//DAY6
//closures - 1
import UIKit

//Closure : Closures are self-contained blocks of functionality that can be passed around and used in your code.

//--------------------------------------------------------------------------------------------------

//Creating basic closures
/*
 Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.

 Functions used in this way are called closures, and although they work like functions they are written a little differently.
 */

let driving = {
    print("I'm driving in my car")
}
//That effectively creates a function without a name, and assigns that function to driving. You can now call driving() as if it were a regular function, like this:
driving()


//--------------------------------------------------------------------------------------------------

//Accepting parameters in a closure
/*
 When you create closures, they don’t have a name or space to write any parameters. That doesn’t mean they can’t accept parameters, just that they do so in a different way: they are listed inside the open braces.

 To make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting.
 */
let driving_1 = { (place: String) in
    print("I'm going to \(place) in my car")
}
//One of the differences between functions and closures is that you don’t use parameter labels when running closures. So, to call driving() now we’d write this:
driving_1("London")


//--------------------------------------------------------------------------------------------------

//Returning values from a closure
/*
 Closures can also return values, and they are written similarly to parameters: you write them inside your closure, directly before the in keyword.
 */

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

//--------------------------------------------------------------------------------------------------

//Closures as parameters
/*
 If we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”.

 So, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after:
 */
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

//We can now call that using our driving closure, like this:
travel(action: driving)

//--------------------------------------------------------------------------------------------------

//Trailing closure syntax
/*
 If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

 To demonstrate this, we use above travel() function again. It accepts an action closure so that it can be run between two print() calls:
 */

//Because its last parameter is a closure, we can call travel() using trailing closure syntax like this:
travel() {
    print("I'm driving in my car")
}

//In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:
travel {
    print("I'm driving in my car")
}

//--------------------------------------------------------------------------------------------------

//Using closures as parameters when they accept parameters
/*
 This is where closures can start to be read a bit like line noise: a closure you pass into a function can also accept its own parameters.

 We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () with the types of any parameters that your closure should accept.

 To demonstrate this, we can write a travel() function that accepts a closure as its only parameter, and that closure in turn accepts a string:
 */
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

//Now when we call travel() using trailing closure syntax, our closure code is required to accept a string:
travel { (place: String) in
    print("I'm going to \(place) in my car")
}

//--------------------------------------------------------------------------------------------------

//Using closures as parameters when they return values
/*
 We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can replace that Void with any type of data to force the closure to return a value.
 */
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

//Now when we call travel() using trailing closure syntax, our closure code is required to accept a string and return a string:
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

//--------------------------------------------------------------------------------------------------
//Shorthand parameter names
//We just made a travel() function. It accepts one parameter, which is a closure that itself accepts one parameter and returns a string. That closure is then run between two calls to print().

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

//However, Swift knows the parameter to that closure must be a string, so we can remove it:
travel { place -> String in
    return "I'm going to \(place) in my car"
}

//It also knows the closure must return a string, so we can remove that:
travel { place in
    return "I'm going to \(place) in my car"
}

//As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:
travel { place in
    "I'm going to \(place) in my car"
}

//Swift has a shorthand syntax that lets you go even shorter. Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
travel {
    "I'm going to \($0) in my car"
}

//--------------------------------------------------------------------------------------------------

//Closures with multiple parameters
/*
 Just to make sure everything is clear, we’re going to write another closure example using two parameters.

 This time our travel() function will require a closure that specifies where someone is traveling to, and the speed they are going. This means we need to use (String, Int) -> String for the parameter’s type:
 */
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

//We’re going to call that using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, we’ll be getting both $0 and $1:
travel {
    "I'm going to \($0) at \($1) miles per hour."
}
//note:Some people prefer not to use shorthand parameter names like $0 because it can be confusing, and that’s OK – do whatever works best for you.

//--------------------------------------------------------------------------------------------------

//Returning closures from functions
/*
 In the same way that you can pass a closure to a function, you can get closures returned from a function too.

 The syntax for this is a bit confusing a first, because it uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value.

 To try this out, we’re going to write a travel() function that accepts no parameters, but returns a closure. The closure that gets returned must be called with a string, and will return nothing.
 */
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

//We can now call travel() to get back that closure, then call it as a function:
let result = travel()
result("London")

//It’s technically allowable – although really not recommended! – to call the return value from travel() directly:
let result2 = travel()("London")

//--------------------------------------------------------------------------------------------------

//Capturing values
/*
 If you use any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist any more.

 Right now we have a travel() function that returns a closure, and the returned closure accepts a string as its only parameter and returns nothing:
 */

func travel_1() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

//We can call travel() to get back the closure, then call that closure freely:
let result_1 = travel_1()
result_1("London")

//Closure capturing happens if we create values in travel() that get used inside the closure. For example, we might want to track how often the returned closure is called:
func travel_2() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

//Even though that counter variable was created inside travel(), it gets captured by the closure so it will still remain alive for that closure.

//So, if we call result("London") multiple times, the counter will go up and up:
result_1("London")
result_1("London")
result_1("London")


//--------------------------------------------------------------------------------------------------

//Closures summary
/*You can assign closures to variables, then call them later on.
-Closures can accept parameters and return values, like regular functions.
-You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
-If the last parameter to your function is a closure, you can use trailing closure syntax.
-Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
-If you use external values inside your closures, they will be captured so the closure can refer to them later.
*/
