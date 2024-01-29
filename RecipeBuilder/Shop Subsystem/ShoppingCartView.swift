//
//  ShoppingCartView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 26.01.24.
//

import SwiftUI

struct ShoppingCartView: View {
    @ObservedObject var viewModel: ShoppingCartViewModel
    
    init(_ model: Model) {
        viewModel = ShoppingCartViewModel(model)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.shoppingCartItems, id: \.self) { item in
                    HStack {
                        Text(viewModel.getShoppingCartItemText(item: item))
                            .info()
                        Spacer()
                        Button("") {
                            viewModel.deleteItem(item)
                        }
                        .buttonStyle(ShoppingCartItemButtonStyle())
                    }
                }
            }
            .navigationTitle(viewModel.navigationTitle)
        }
    }
}


// MARK: Previews
struct ShoppingCartView_Previews: PreviewProvider {
    static var model = MockModel()
    
    static var previews: some View {
        Group {
            NavigationView {
                ShoppingCartView(model)
            }
            
            NavigationView {
                ShoppingCartView(model)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
