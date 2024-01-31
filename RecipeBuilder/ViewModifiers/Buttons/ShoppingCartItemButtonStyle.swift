//
//  ShoppingCartItemButtonStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 29.01.24.
//

import Foundation
import SwiftUI

struct ShoppingCartItemButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    let isDone: Bool

    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: isDone ? AppStrings.ShoppingCart.shoppingCartItemDoneImageName : AppStrings.ShoppingCart.shoppingCartItemPendingImageName)
            .padding(7)
    }
}

