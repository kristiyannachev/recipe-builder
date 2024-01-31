//
//  AppStrings.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 11.01.24.
//

import Foundation

struct AppStrings {
    enum Categories {
        static let navigationTitle = "Recipe Categories"
    }
    
    enum Recipes {
        static let navigationTitle = "Recipes"
        static let cancelAddRecipeText = "Cancel"
        static let addRecipeText = "Done"
        static let showAddRecipeViewImageName = "plus"
        static let backupImageName = "backup"
    }
    
    enum RecipeRow {
        static let recipeInfoHeadline = "Recipe info"
        static let authorImageName = "person"
        static let restTimeText = "minutes"
        static let timeImageName = "clock"
        static let restServingsText = "servings"
        static let servingsImageName = "fork.knife"
    }
    
    enum RecipeDetail {
        static let recipeInfoHeadline = "Recipe info"
        static let addToCartText = "Add to cart"
        static let addToCartImageName = "cart.badge.plus"
        static let authorImageName = "person"
        static let categoryImageName = "folder"
        static let restTimeText = "minutes"
        static let timeImageName = "clock"
        static let restServingsText = "servings"
        static let servingsImageName = "fork.knife"
        static let ingredientsInfoHeadline = "Ingredients"
        static let stepsInfoHeadline = "Steps"
        static let showEditRecipeText = "Edit"
        static let cancelSaveRecipeText = "Cancel"
        static let saveRecipeText = "Done"
    }
    
    enum RecipeEdit {
        static let imageSectionText = "Image"
        static let editImageImageName = "pencil"
        static let recipeInfoSectionText = "Recipe info"
        static let recipeTitleTextFieldText = "Recipe title"
        static let authorTextFieldText = "Author"
        static let categoryText = "Category"
        static let timeText = "Time"
        static let servingsText = "Servings"
        static let ingredientsSectionText = "Ingredients"
        static let removeIngredientImageName = "minus.circle"
        static let addImageName = "plus"
        static let ingredientValueTextFieldText = "Value"
        static let stepsSectionText = "Steps"
        static let addRecipeTitle = "Add"
        static let editRecipeTitle = "Edit"
        static let restRecipeTitle = "recipe"
    }
    
    enum IngredientAdd {
        static let contentTextFieldText = "Content"
        static let valueTextFieldText = "Value"
        static let measurementPickerText = "Measurement"
        static let navigationTitle = "Add ingredient"
        static let saveIngredientText = "Save"
    }
    
    enum StepEdit {
        static let stepTextFieldText = "Enter step here"
        static let saveStepText = "Save"
        static let addStepTitle = "Add"
        static let editStepTitle = "Edit"
        static let restStepTitle = "step"
    }
    
    enum ShoppingCart {
        static let navigationTitle = "Shopping Cart"
        static let shoppingCartItemPendingImageName = "circle"
        static let shoppingCartItemDoneImageName = "checkmark.circle.fill"
        static let deleteShoppingCartItemButtonText = "Delete"
    }
}
