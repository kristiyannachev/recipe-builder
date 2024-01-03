//
//  RecipeDataManager.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 3.01.24.
//


import Foundation

struct RecipeDataManager {
    func load(completion: @escaping ([Recipe]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            
            // Copy the recipes.json file to the user's documents folder if it's not already there
            // (you and I should never save files back to the application bundle directory, so make an initial copy)
            if FileManager.default.fileExists(atPath: Self.fileURL.path) == false {
                let bundledRecipesURL = Bundle.main.url(forResource: "recipes", withExtension: "json")!
                try! FileManager.default.copyItem(at: bundledRecipesURL, to: Self.fileURL)
            }
            
            // Attempt to load the contents of the recipes.json file that's in the user's documents folder
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                return
            }
            
            // Prepare a JSONDecoder, ensuring that it can successfully decode dates into the Swift Date type
            let decoder = JSONDecoder()
            
            // Attempt to decode the JSON document into an array of Recipe instances
            guard let recipes = try? decoder.decode([Recipe].self, from: data) else {
                fatalError("Can't decode saved recipe data")
            }
            
            // Pass the array of Recipe instances back to the caller through the completion handler that is passed in
            DispatchQueue.main.async {
                completion(recipes)
            }
        }
    }
    
    func save(recipes: [Recipe]) {
        DispatchQueue.global(qos: .background).async {
            // Prepare a JSONEncoder, ensuring that it can successfully re-encode dates from the Swift Date type into text within the resulting JSON representation
            let encoder = JSONEncoder()
            
            // Attempt to encode the array of Recipe instances into a JSON document
            guard let recipesData = try? encoder.encode(recipes) else { fatalError("Error encoding data") }
            do {
                // Write the encoded JSON document to the user's document's folder
                let outfile = Self.fileURL
                try recipesData.write(to: outfile)
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
        return documentsFolder.appendingPathComponent("recipes.json")
    }
}
