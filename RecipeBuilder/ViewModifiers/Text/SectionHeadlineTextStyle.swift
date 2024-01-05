//
//  SectionHeadlineTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 3.01.24.
//

import SwiftUI

// MARK: SectionHeadline
struct SectionHeadline: ViewModifier {
    var padding = true
    var isDark: Bool
    
    func body(content: Content) -> some View {
        HStack {
            content
                .font(.system(size: 24.0, weight: .bold, design: .serif))
                .foregroundColor(isDark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
            Spacer()
        }.padding(.bottom, padding ? 5 : 0)
    }
}

// MARK: View + sectionHeadline
extension View {
    func sectionHeadline(isDark: Bool) -> some View {
        modifier(SectionHeadline(isDark: isDark))
    }
}

// MARK: View + sectionHeadlineNoPadding
extension View {
    func sectionHeadlineNoPadding(isDark: Bool) -> some View {
        modifier(SectionHeadline(padding: false, isDark: isDark))
    }
}
