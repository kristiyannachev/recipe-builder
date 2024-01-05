//
//  RecipeRowInfoTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 5.01.24.
//

import SwiftUI

// MARK: InfoTextStyle
struct RecipeRowInfoTextStyle: ViewModifier {
    var isDark: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15.0, weight: .regular, design: .serif))
            .foregroundColor(isDark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
    }
}

// MARK: View + info
extension View {
    func recipeRowInfo(isDark: Bool) -> some View {
        modifier(RecipeRowInfoTextStyle(isDark: isDark))
    }
}
