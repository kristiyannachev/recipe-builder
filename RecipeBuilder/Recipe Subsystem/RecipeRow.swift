//
//  RecipeRow.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import SwiftUI

struct RecipeRow: View {
    @Environment(\.colorScheme) var colorScheme

    var recipe: Recipe
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(recipe.imageName)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .leading)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(recipe.title)
                        .recipeRowHeadlineNoPadding(isDark: colorScheme == .dark)
                    VStack(alignment: .leading) {
                        Label(recipe.author, systemImage: "person")
                        Label("\(recipe.time.rawValue) minutes", systemImage: "clock")
                        Label("\(recipe.servings.rawValue) servings", systemImage: "fork.knife")
                    }
                    .recipeRowInfo(isDark: colorScheme == .dark)
                }
                
                Spacer()
            }
        }.padding(.trailing)
    }
}

// MARK: Previews
struct RecipeRow_Previews: PreviewProvider {
    static var model = MockModel()
    
    static var previews: some View {
        Group {
            RecipeRow(recipe: model.recipes[0])
                .previewLayout(.fixed(width: 400, height: 100))
            
            RecipeRow(recipe: model.recipes[0])
                .previewLayout(.fixed(width: 400, height: 100))
                .preferredColorScheme(.dark)
        }
    }
}
