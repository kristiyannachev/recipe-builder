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
    
    func body(content: Content) -> some View {
        HStack {
            content
                .font(.system(size: 20.0, weight: .bold, design: .serif))
                .foregroundColor(UIStyle.primary)
            Spacer()
        }.padding(.bottom, padding ? 5 : 0)
    }
}

// MARK: View + sectionHeadline
extension View {
    func recipeRowHeadline() -> some View {
        modifier(RecipeRowHeadline())
    }
}

// MARK: View + sectionHeadlineNoPadding
extension View {
    func recipeRowHeadlineNoPadding() -> some View {
        modifier(RecipeRowHeadline(padding: false))
    }
}
