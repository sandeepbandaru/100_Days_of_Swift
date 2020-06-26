//DAY3
//Operators and conditions
import UIKit

//Arithmetic operators

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore //divide

let remainder = 13 % secondScore // calculating remainders


//operator overloading

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

// Swift is a type-safe language, which means it won’t let you mix types. For example, you can’t add an integer to a string because it doesn’t make any sense.


//Compound assignment operators

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

//Comparison operators

let first_Score = 6
let second_Score = 4

first_Score == second_Score
first_Score != second_Score

first_Score < second_Score
first_Score >= second_Score

//Each of these also work with strings, because strings have a natural alphabetical order
"Taylor" <= "Swift"

//Conditions

let firstCard = 11
let secondCard = 10

//:if
if firstCard + secondCard == 21 {
    print("Blackjack!")
}

//:if-else
if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

//:elseif
if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}


//Combining conditions
//Swift has two special operators that let us combine conditions together: they are && (pronounced “and”) and || (pronounced “or”).

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

//The ternary operator
//Swift has a rarely used operator called the ternary operator. It works with three values at once, which is where its name comes from: it checks a condition specified in the first value, and if it’s true returns the second value, but if it’s false returns the third value.
let first_Card = 11
let second_Card = 10
print(first_Card == second_Card ? "Cards are the same" : "Cards are different")

//similar to ifelse
if first_Card == second_Card {
    print("Cards are the same")
} else {
    print("Cards are different")
}

//Switch Statements
//If you have several conditions using if and else if, it’s often clearer to use a different construct known as switch case. Using this approach you write your condition once, then list all possible outcomes and what should happen for each of them.

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

//Swift will only run the code inside each case. If you want execution to continue on to the next case, use the "fallthrough" keyword

//Range operators
//Swift gives us two ways of making ranges :the ..< and ... operators.
//The half-open range operator, ..<, creates ranges up to but excluding the final value
//the closed range operator, ..., creates ranges up to and including the final value.

let marks = 85

switch marks {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

//Operators and conditions summary

/*
 -Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
 -There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
 -You can use if, else, and else if to run code based on the result of a condition.
 -Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
 -If you have multiple conditions using the same value, it’s often clearer to use switch instead.
 -You can make ranges using ..< and ... depending on whether the last number should be excluded or included.

 */
