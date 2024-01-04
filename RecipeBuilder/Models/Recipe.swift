//
//  Recipe.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import Foundation

struct Recipe: Codable {
    var recipeNumber: Int = 0
    var title: String = ""
    var author: String = ""
    var time: TimeValue = .five
    var servings: ServingsValue = .one
    var imageName: String = ""
    var ingredients: [Ingredient] = []
    var steps: [String] = []
    
    enum ServingsValue: String, Codable, CaseIterable {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case eleven = "11"
        case twelve = "12"
        case thirteen = "13"
        case fourteen = "14"
        case fifteen = "15"
        case sixteen = "16"
        case seventeen = "17"
        case eighteen = "18"
        case nineteen = "19"
        case twenty = "20"
    }
    
    enum TimeValue: String, Codable, CaseIterable {
        case five = "5"
        case ten = "10"
        case fifteen = "15"
        case twenty = "20"
        case twentyFive = "25"
        case thirty = "30"
        case thirtyFive = "35"
        case fourty = "40"
        case fourtyFive = "45"
        case fifty = "50"
        case fiftyFive = "55"
        case sixty = "60"
        case sixtyFive = "65"
        case seventy = "70"
        case seventyFive = "75"
        case eighty = "80"
        case eightyFive = "85"
        case ninety = "90"
        case hundred = "100"
        case hundredTen = "110"
        case hundredTwenty = "120"
        case hundredThirty = "130"
        case hundredFourty = "140"
        case hundredFifty = "150"
        case hundredSixty = "160"
        case hundredSeventy = "170"
        case hundredEighty = "180"
        case hundredNinety = "190"
        case twoHundred = "200"
        case twoHundredTen = "210"
        case twoHundredTwenty = "220"
        case twoHundredThirty = "230"
        case twoHundredFourty = "240"
    }
}

extension Recipe {
    static var testData: [Recipe] {
        return [
            Recipe(recipeNumber: 1,
                   title: "Spinach lasagne",
                   author: "Kris",
                   time: .fourtyFive,
                   servings: .eight,
                   imageName: "spinach-lasagne",
                   ingredients: [
                     Ingredient(content: .pasta, measurement: .grams, value: 500),
                     Ingredient(content: .spinach, measurement: .grams, value: 500),
                     Ingredient(content: .cheese, measurement: .kilograms, value: 1),
                     Ingredient(content: .egg, measurement: .pieces, value: 3),
                     Ingredient(content: .onion, measurement: .pieces, value: 1),
                     Ingredient(content: .garlic, measurement: .slices, value: 2),
                     Ingredient(content: .oliveOil, measurement: .tablespoons, value: 2),
                     Ingredient(content: .milk, measurement: .mililiters, value: 1200),
                     Ingredient(content: .butter, measurement: .grams, value: 60),
                     Ingredient(content: .flour, measurement: .grams, value: 60),
                     Ingredient(content: .salt, measurement: .miligrams, value: 8)
                   ],
                   steps: [
                    "For the béchamel, fry the flour until golden in the heated butter.",
                    "Gradually, stirring constantly, pour in the milk. Cook until the sauce thickens slightly. It should remain slightly thinner than usual because the crusts are uncooked and will absorb the liquid. Turn off the heat and season with the mustard, salt and pepper.",
                    "Saute the onion and garlic and fry them in the olive oil until soft and glassy.",
                    "Pour boiling water over the spinach to soften. Then cool it under cold running water and drain very well, squeezing it with your hands. Chop it finely.",
                    "Mix the spinach, grated Parmesan, crumbled gorgonzola and ricotta. Mix well. Add the fried onion and garlic, eggs, nutmeg, salt and pepper to taste and mix well again.",
                    "Pour the bechamel on the bottom of the baking dish. Arrange the lasagne crusts on top. Pour over the béchamel, sprinkle over some of the spinach mixture and arrange the mozzarella slices. Alternate in this way until you run out of products. Finish with the crusts, béchamel and mozzarella.",
                    "Preheat the oven to 180 degrees with a fan. Bake the lasagne for 40 minutes. Allow to cool slightly, cut and serve."
                   ])
        ]
    }
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
