//
//  InfoTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 3.01.24.
//

import SwiftUI

// MARK: InfoTextStyle
struct InfoTextStyle: ViewModifier {
    var isDark: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18.0, weight: .regular, design: .serif))
            .foregroundColor(isDark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
    }
}

// MARK: View + info
extension View {
    func info(isDark: Bool) -> some View {
        modifier(InfoTextStyle(isDark: isDark))
    }
}
