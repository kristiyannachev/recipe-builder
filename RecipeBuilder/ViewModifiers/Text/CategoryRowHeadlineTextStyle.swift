//
//  CategoryRowHeadlineTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 16.01.24.
//


import SwiftUI

// MARK: SectionHeadline
struct CategoryRowHeadline: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var padding = true
    
    func body(content: Content) -> some View {
        HStack {
            content
                .font(.system(size: 24.0, weight: .bold, design: .serif))
                .foregroundColor(colorScheme == .dark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
            Spacer()
        }.padding(padding ? 10 : 0)
    }
}

// MARK: View + sectionHeadline
extension View {
    func categoryRowHeadline() -> some View {
        modifier(CategoryRowHeadline())
    }
}

// MARK: View + sectionHeadlineNoPadding
extension View {
    func categoryRowHeadlineNoPadding() -> some View {
        modifier(CategoryRowHeadline(padding: false))
    }
}
