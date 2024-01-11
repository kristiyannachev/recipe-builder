//
//  AppConstants.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 11.01.24.
//

import Foundation

struct AppConstants {
    enum RecipeRow {
        static let imageWidth: CGFloat = 100
        static let imageHeight: CGFloat = 100
        static let imageCornerRadius: CGFloat = 10
        static let spacing: CGFloat = 10
    }
    
    enum RecipeDetail {
        static let imageHeight: CGFloat = 300
        static let imageCornerRadius: CGFloat = 15
        static let spacing: CGFloat = 10
    }
    
    enum RecipeEdit {
        static let spacing: CGFloat = 10
        static let ingredientValueTextFieldTextWidth: CGFloat = 60
        static let ingredientMeasurementWidth: CGFloat = 35
    }
}
