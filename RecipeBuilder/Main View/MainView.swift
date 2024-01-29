//
//  MainView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 5.01.24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var model: Model

    var body: some View {
        TabView {
            RecipeCategoriesView(model)
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
            ShoppingCartView(model)
                .tabItem {
                    Label("Shopping Cart", systemImage: "cart")
                }
        }
    }
}

// MARK: Previews
struct MainView_Previews: PreviewProvider {
    static var model = MockModel()
    
    static var previews: some View {
        Group {
            NavigationView {
                MainView()
                    .environmentObject(model)
            }
            
            NavigationView {
                MainView()
                    .environmentObject(model)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
