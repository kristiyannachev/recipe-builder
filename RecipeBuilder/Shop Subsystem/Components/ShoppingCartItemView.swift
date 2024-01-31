//
//  ShoppingCartItemView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 31.01.24.
//

import SwiftUI

struct ShoppingCartItemView: View {
    @ObservedObject var viewModel: ShoppingCartItemViewModel
    let item: ShoppingCartItem
    
    init(_ model: Model, item: ShoppingCartItem) {
        viewModel = ShoppingCartItemViewModel(model)
        self.item = item
    }
    
    var body: some View {
        HStack {
            Text(viewModel.getShoppingCartItemText(item: item))
                .shoppingCartItem(isDone: item.state == .done)
            Spacer()
            Button("") {
                viewModel.setDoneItem(item)
            }
            .buttonStyle(ShoppingCartItemButtonStyle(isDone: item.state == .done))
        }
    }
}
