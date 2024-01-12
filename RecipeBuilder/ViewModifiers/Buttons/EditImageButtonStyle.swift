//
//  EditImageButtonStyle.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 12.01.24.
//

import Foundation
import SwiftUI

struct EditImageButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme

    func makeBody(configuration: Configuration) -> some View {
        Text(Image(systemName: AppStrings.RecipeEdit.editImageImageName))
            .info()
            .padding(5)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}
