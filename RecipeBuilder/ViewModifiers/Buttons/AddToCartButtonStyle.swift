//
//  AddToCartButtonStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 29.01.24.
//

import Foundation
import SwiftUI

struct AddToCartButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme

    func makeBody(configuration: Configuration) -> some View {
        Label(AppStrings.RecipeDetail.addToCartText, systemImage: AppStrings.RecipeDetail.addToCartImageName)
            .mainButton()
            .padding(7)
            .background(colorScheme == .dark ? UIStyle.primaryDarkMode : UIStyle.primaryLightMode)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 5)
    }
}
