//
//  ShoppingCartDataManager.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 27.01.24.
//

import Foundation

struct ShoppingCartDataManager {
    func load(completion: @escaping ([ShoppingCartItem]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            
            // Copy the recipes.json file to the user's documents folder if it's not already there
            // (you and I should never save files back to the application bundle directory, so make an initial copy)
            if FileManager.default.fileExists(atPath: Self.fileURL.path) == false {
                let bundledRecipesURL = Bundle.main.url(forResource: "shoppingCartItems", withExtension: "json")!
                try! FileManager.default.copyItem(at: bundledRecipesURL, to: Self.fileURL)
            }
            
            // Attempt to load the contents of the recipes.json file that's in the user's documents folder
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                return
            }
            
            // Prepare a JSONDecoder, ensuring that it can successfully decode dates into the Swift Date type
            let decoder = JSONDecoder()
            
            // Attempt to decode the JSON document into an array of Recipe instances
            guard let items = try? decoder.decode([ShoppingCartItem].self, from: data) else {
                fatalError("Can't decode saved recipe data")
            }
            
            // Pass the array of Recipe instances back to the caller through the completion handler that is passed in
            DispatchQueue.main.async {
                completion(items)
            }
        }
    }
    
    func save(items: [ShoppingCartItem]) {
        DispatchQueue.global(qos: .background).async {
            // Prepare a JSONEncoder, ensuring that it can successfully re-encode dates from the Swift Date type into text within the resulting JSON representation
            let encoder = JSONEncoder()
            
            // Attempt to encode the array of Recipe instances into a JSON document
            guard let itemsData = try? encoder.encode(items) else { fatalError("Error encoding data") }
            do {
                // Write the encoded JSON document to the user's document's folder
                let outfile = Self.fileURL
                try itemsData.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
    
    // MARK: Helper functions
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("shoppingCartItems.json")
    }
}
