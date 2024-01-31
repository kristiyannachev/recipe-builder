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
                ForEach(viewModel.shoppingCartItemsPending) { item in
                    viewModel.getShoppingCartItemView(item: item)
                        .swipeActions {
                            Button(viewModel.deleteShoppingCartItemButtonText) {
                                viewModel.deleteItem(item)
                            }
                            .tint(.red)
                        }
                }
                ForEach(viewModel.shoppingCartItemsDone) { item in
                    viewModel.getShoppingCartItemView(item: item)
                        .swipeActions {
                            Button(viewModel.deleteShoppingCartItemButtonText) {
                                viewModel.deleteItem(item)
                            }
                            .tint(.red)
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
