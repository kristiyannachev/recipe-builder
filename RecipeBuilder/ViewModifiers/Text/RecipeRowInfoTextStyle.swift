//
//  RecipeRowInfoTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 5.01.24.
//

import SwiftUI

// MARK: InfoTextStyle
struct RecipeRowInfoTextStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .font(.system(size: 15.0, weight: .regular, design: .serif))
            .foregroundColor(colorScheme == .dark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
    }
}

// MARK: View + info
extension View {
    func recipeRowInfo() -> some View {
        modifier(RecipeRowInfoTextStyle())
    }
}
