//
//  Recipe + SwiftUI.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import Foundation
import SwiftUI

extension Recipe: Identifiable {
    var id: Int {
        self.recipeNumber
    }
}
