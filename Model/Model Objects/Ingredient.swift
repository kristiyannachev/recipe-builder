//
//  Ingredient.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 3.01.24.
//

import Foundation

struct Ingredient: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var content: IngredientContent = .other
    var measurement: IngredientMeasurement = .pieces
    var value: Int = 0
    
    enum IngredientContent: String, Codable, CaseIterable {
        // Fruits
        case raisin = "Raisin"
        case melon = "Melon"
        case watermelon = "Watermelon"
        case tangerine = "Tangerine"
        case lemon = "Lemon"
        case banana = "Banana"
        case pineapple = "Pineapple"
        case mango = "Mango"
        case redApple = "RedApple"
        case greenApple = "GreenApple"
        case pear = "Pear"
        case peach = "Peach"
        case cherry = "Cherry"
        case strawberry = "Strawberry"
        case blueberry = "Blueberry"
        case kiwi = "Kiwi"
        case tomato = "Tomato"
        case oliveOil = "Olive oil"
        case coconut = "Coconut"
        
        // Vegetables
        case avocado = "Avocado"
        case eggplant = "Eggplant"
        case potato = "Potato"
        case carrot = "Carrot"
        case corn = "Corn"
        case hotPepper = "HotPepper"
        case bellPepper = "BellPepper"
        case cucumber = "Cucumber"
        case spinach = "Spinach"
        case broccoli = "Broccoli"
        case garlic = "Garlic"
        case onion = "Onion"
        case peanuts = "Peanuts"
        case mushroom = "Mushroom"
        case nut = "Nut"
        case sweetPotato = "SweetPotato"
        case pumpkin = "Pumpkin"
        case greenSalad = "GreenSalad"
        case popcorn = "Popcorn"
        case cannedTomatoes = "CannedTomatoes"
        case hibiscus = "Hibiscus"
        case herb = "Herb"
        case oil = "Oil"
        case flowers = "Flowers"
        
        // Base products
        case rice = "Rice"
        case flour = "Flour"
        case cheese = "Cheese"
        case milk = "Milk"
        case egg = "Egg"
        case butter = "Butter"
        case salt = "Salt"
        case sugar = "Sugar"
        case other = "Other"
        
        // Meat
        case ham = "Ham"
        case poultryLeg = "PoultryLeg"
        case steak = "Steak"
        case bacon = "Bacon"
        case deer = "Deer"
        case beef = "Beef"
        case boar = "Boar"
        case pork = "Pork"
        case rabbit = "Rabbit"
        case kangaroo = "Kangaroo"
        case chicken = "Chicken"
        case turkey = "Turkey"
        case duck = "Duck"
        case frog = "Frog"
        case snail = "Snail"
        
        // Fish & seafood
        case fish = "Fish"
        case tropicalFish = "TropicalFish"
        case blowfish = "Blowfish"
        case shark = "Shark"
        case octopus = "Octopus"
        case crab = "Crab"
        case lobster = "Lobster"
        case shrimp = "Shrimp"
        case squid = "Squid"
        case oyster = "Oyster"
        case prawn = "Prawn"
        
        // Sweets
        case iceCream = "IceCream"
        case cookie = "Cookie"
        case chocolate = "Chocolate"
        case honey = "Honey"
        case mapleSyrop = "MapleSyrop"
        
        // Liquids
        case water = "Water"
        case coffee = "Coffee"
        case tea = "Tea"
        case sake = "Sake"
        case redWine = "RedWine"
        case beer = "Beer"
        case champagne = "Champagne"
        case whiskey = "Whiskey"
        case bubbleTea = "BubbleTea"
        case juice = "Juice"
        case cactusJuice = "CactusJuice"
        case mate = "Mate"
        
        // Pastries
        case bread = "Bread"
        case croissant = "Croissant"
        case baguette = "Baguette"
        case flatbread = "Flatbread"
        case pretzel = "Pretzel"
        case bagel = "Bagel"
        case pancakes = "Pancakes"
        case waffle = "Waffle"
        case noodles = "Noodles"
        case pasta = "Pasta"
        case mustard = "Mustard"
        
        var emoji: String {
            switch self {
            case .raisin: return "🍇"
            case .melon: return "🍈"
            case .watermelon: return "🍉"
            case .tangerine: return "🍊"
            case .lemon: return "🍋"
            case .banana: return "🍌"
            case .pineapple: return "🍍"
            case .mango: return "🥭"
            case .redApple: return "🍎"
            case .greenApple: return "🍏"
            case .pear: return "🍐"
            case .peach: return "🍑"
            case .cherry: return "🍒"
            case .strawberry: return "🍓"
            case .blueberry: return "🫐"
            case .kiwi: return "🥝"
            case .tomato: return "🍅"
            case .oliveOil: return "🫒"
            case .coconut: return "🥥"
            case .avocado: return "🥑"
            case .eggplant: return "🍆"
            case .potato: return "🥔"
            case .carrot: return "🥕"
            case .corn: return "🌽"
            case .hotPepper: return "🌶️"
            case .bellPepper: return "🫑"
            case .cucumber: return "🥒"
            case .spinach: return "🥬"
            case .broccoli: return "🥦"
            case .garlic: return "🧄"
            case .onion: return "🧅"
            case .peanuts: return "🥜"
            case .mushroom: return "🍄"
            case .nut: return "🌰"
            case .sweetPotato: return "🍠"
            case .pumpkin: return "🎃"
            case .greenSalad: return "🥗"
            case .popcorn: return "🍿"
            case .cannedTomatoes: return "🥫"
            case .hibiscus: return "🌺"
            case .herb: return "🌿"
            case .oil: return "🌻"
            case .flowers: return "💐"
            case .rice: return "🍚"
            case .flour: return "🌾"
            case .cheese: return "🧀"
            case .milk: return "🥛"
            case .egg: return "🥚"
            case .butter: return "🧈"
            case .salt: return "🧂"
            case .sugar: return "🍬"
            case .other: return "🥘"
            case .ham: return "🍖"
            case .poultryLeg: return "🍗"
            case .steak: return "🥩"
            case .bacon: return "🥓"
            case .deer: return "🦌"
            case .beef: return "🐂"
            case .boar: return "🐗"
            case .pork: return "🐖"
            case .rabbit: return "🐇"
            case .kangaroo: return "🦘"
            case .chicken: return "🐔"
            case .turkey: return "🦃"
            case .duck: return "🦆"
            case .frog: return "🐸"
            case .snail: return "🐌"
            case .fish: return "🐟"
            case .tropicalFish: return "🐠"
            case .blowfish: return "🐡"
            case .shark: return "🦈"
            case .octopus: return "🐙"
            case .crab: return "🦀"
            case .lobster: return "🦞"
            case .shrimp: return "🦐"
            case .squid: return "🦑"
            case .oyster: return "🦪"
            case .prawn: return "🍤"
            case .iceCream: return "🍨"
            case .cookie: return "🍪"
            case .chocolate: return "🍫"
            case .honey: return "🍯"
            case .mapleSyrop: return "🍁"
            case .water: return "🚰"
            case .coffee: return "☕"
            case .tea: return "🫖"
            case .sake: return "🍶"
            case .redWine: return "🍷"
            case .beer: return "🍺"
            case .champagne: return "🥂"
            case .whiskey: return "🥃"
            case .bubbleTea: return "🧋"
            case .juice: return "🧃"
            case .cactusJuice: return "🌵"
            case .mate: return "🧉"
            case .bread: return "🍞"
            case .croissant: return "🥐"
            case .baguette: return "🥖"
            case .flatbread: return "🫓"
            case .pretzel: return "🥨"
            case .bagel: return "🥯"
            case .pancakes: return "🥞"
            case .waffle: return "🧇"
            case .noodles: return "🍜"
            case .pasta: return "🍝"
            case .mustard: return "🌭"
            }
        }
    }

    enum IngredientMeasurement: String, Codable, CaseIterable {
        case pieces = "pcs"
        case slices = "sl"
        case kilograms = "kg"
        case grams = "gr"
        case miligrams = "mg"
        case liters = "l"
        case mililiters = "ml"
        case teaspoons = "tsp"
        case tablespoons = "tbsp"
        case cups = "cups"
    }
    
    private enum CodingKeys : String, CodingKey { case content, measurement, value }
}
