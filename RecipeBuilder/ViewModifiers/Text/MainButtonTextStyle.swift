//
//  MainButtonTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 29.01.24.
//

import SwiftUI

// MARK: MainButtonTextStyle
struct MainButtonTextStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18.0, weight: .regular, design: .serif))
            .foregroundColor(colorScheme == .dark ?  UIStyle.primaryLightMode : UIStyle.primaryDarkMode)
    }
}

// MARK: View + info
extension View {
    func mainButton() -> some View {
        modifier(MainButtonTextStyle())
    }
}
