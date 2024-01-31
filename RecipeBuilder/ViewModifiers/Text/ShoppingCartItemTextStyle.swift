//
//  ShoppingCartItemTextStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 31.01.24.
//

import SwiftUI

// MARK: ShoppingCartItemTextStyle
struct ShoppingCartItemTextStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let isDone: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18.0, weight: .semibold, design: .serif))
            .foregroundColor(colorScheme == .dark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
            .strikethrough(isDone)
    }
}

// MARK: View + info
extension View {
    func shoppingCartItem(isDone: Bool) -> some View {
        modifier(ShoppingCartItemTextStyle(isDone: isDone))
    }
}
