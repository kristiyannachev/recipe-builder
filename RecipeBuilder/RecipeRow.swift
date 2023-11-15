//
//  RecipeRow.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import SwiftUI

struct RecipeRow: View {
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
                        .font(.headline)
                    VStack(alignment: .leading) {
                        Label(recipe.author, systemImage: "person")
                        Label(recipe.time, systemImage: "clock")
                        Label(recipe.servings, systemImage: "fork.knife")
                    }
                    .foregroundColor(.accentColor)
                }
                
                Spacer()
            }
        }.padding(.trailing)
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeRow(recipe: Recipe.testData[0])
                .previewLayout(.fixed(width: 400, height: 100))
            
            RecipeRow(recipe: Recipe.testData[0])
                .previewLayout(.fixed(width: 400, height: 100))
                .preferredColorScheme(.dark)
        }
        
    }
}
