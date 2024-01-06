//
//  Recipe.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import Foundation

struct Recipe: Codable, Identifiable {
    var id: UUID = UUID()
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
    
    private enum CodingKeys : String, CodingKey { case title, author, time, servings, imageName, ingredients, steps }
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
