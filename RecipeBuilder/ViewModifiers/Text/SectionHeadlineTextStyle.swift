//
//  SectionHeadlineTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 3.01.24.
//

import SwiftUI

// MARK: SectionHeadline
struct SectionHeadline: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var padding = true
    
    func body(content: Content) -> some View {
        HStack {
            content
                .font(.system(size: 24.0, weight: .bold, design: .serif))
                .foregroundColor(colorScheme == .dark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
            Spacer()
        }.padding(.bottom, padding ? 5 : 0)
    }
}

// MARK: View + sectionHeadline
extension View {
    func sectionHeadline() -> some View {
        modifier(SectionHeadline())
    }
}

// MARK: View + sectionHeadlineNoPadding
extension View {
    func sectionHeadlineNoPadding() -> some View {
        modifier(SectionHeadline(padding: false))
    }
}
