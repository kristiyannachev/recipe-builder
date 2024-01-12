//
//  InfoTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 3.01.24.
//

import SwiftUI

// MARK: InfoTextStyle
struct InfoTextStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18.0, weight: .regular, design: .serif))
            .foregroundColor(colorScheme == .dark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
    }
}

// MARK: View + info
extension View {
    func info() -> some View {
        modifier(InfoTextStyle())
    }
}
