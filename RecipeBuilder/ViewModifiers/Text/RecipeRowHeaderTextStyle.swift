//
//  RecipeRowHeaderTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 3.01.24.
//

import SwiftUI

// MARK: SectionHeadline
struct RecipeRowHeadline: ViewModifier {
    var padding = true
    var isDark: Bool
    
    func body(content: Content) -> some View {
        HStack {
            content
                .font(.system(size: 18.0, weight: .bold, design: .serif))
                .foregroundColor(isDark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
            Spacer()
        }.padding(.bottom, padding ? 5 : 0)
    }
}

// MARK: View + sectionHeadline
extension View {
    func recipeRowHeadline(isDark: Bool) -> some View {
        modifier(RecipeRowHeadline(isDark: isDark))
    }
}

// MARK: View + sectionHeadlineNoPadding
extension View {
    func recipeRowHeadlineNoPadding(isDark: Bool) -> some View {
        modifier(RecipeRowHeadline(padding: false, isDark: isDark))
    }
}
