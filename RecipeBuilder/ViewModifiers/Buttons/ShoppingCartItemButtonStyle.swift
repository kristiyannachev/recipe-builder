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

    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: AppStrings.ShoppingCart.shoppingCartItemImageName)
            .padding(7)
    }
}

