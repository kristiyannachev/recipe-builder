//
//  MainView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 5.01.24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var model: Model
    @State private var tabSelection = 1

    var body: some View {
        TabView(selection: $tabSelection) {
            RecipeCategoriesView(model, tabSelection: $tabSelection)
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
                .tag(1)
            ShoppingCartView(model)
                .tabItem {
                    Label("Shopping Cart", systemImage: "cart")
                }
                .tag(2)
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
