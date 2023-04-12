//
//  DetailsMeal.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 11/04/23.
//

import Foundation

struct DetailsMeal:Decodable{
    
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    
    
    
    func getIngredientList() -> [String] {
        var ingredients: Array<String> = []
        
        // Agrega cada ingrediente no nulo y no vacío a la lista
        if let ingredient1 = self.strIngredient1, !ingredient1.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure1! + ": " + ingredient1.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient2 = self.strIngredient2, !ingredient2.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure2! + ": " + ingredient2.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient3 = self.strIngredient3, !ingredient3.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure3! + ": " + ingredient3.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient4 = self.strIngredient4, !ingredient4.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure4! + ": " + ingredient4.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient5 = self.strIngredient5, !ingredient5.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure5! + ": " + ingredient5.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient6 = self.strIngredient6, !ingredient6.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure6! + ": " + ingredient6.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient7 = self.strIngredient7, !ingredient7.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure7! + ": " + ingredient7.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient8 = self.strIngredient8, !ingredient8.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure8! + ": " + ingredient8.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient9 = self.strIngredient9, !ingredient9.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure9! + ": " + ingredient9.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient10 = self.strIngredient10, !ingredient10.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure10! + ": " + ingredient10.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient11 = self.strIngredient11, !ingredient11.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure11! + ": " + ingredient11.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient12 = self.strIngredient12, !ingredient12.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure12! + ": " + ingredient12.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient13 = self.strIngredient13, !ingredient13.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure13! + ": " + ingredient13.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient14 = self.strIngredient14, !ingredient14.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure14! + ": " + ingredient14.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient15 = self.strIngredient15, !ingredient15.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure15! + ": " + ingredient15.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient16 = self.strIngredient16, !ingredient16.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure16! + ": " + ingredient16.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient17 = self.strIngredient17, !ingredient17.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure17! + ": " + ingredient17.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient18 = self.strIngredient18, !ingredient18.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure18! + ": " + ingredient18.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient19 = self.strIngredient19, !ingredient19.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure19! + ": " + ingredient19.trimmingCharacters(in: .whitespaces))
        }
        if let ingredient20 = self.strIngredient20, !ingredient20.trimmingCharacters(in: .whitespaces).isEmpty {
            ingredients.append(self.strMeasure20! + ": " + ingredient20.trimmingCharacters(in: .whitespaces))
        }
        
        
        return ingredients
        
    }
    
    
    func splitInstructions() -> [String] {
        guard let instructions = self.strInstructions else {
            return []
        }
        let instructionList = instructions.split(separator: "\r\n")
            .filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty && !$0.contains("STEP") }
            .map { String($0) }

        return instructionList
        
    }
    
    
    
}


extension DetailsMeal{
    
    static let dummyData: DetailsMeal = DetailsMeal(
        idMeal: "53023",
        strMeal: "Sledz w Oleju (Polish Herrings)",
        strCategory: "Seafood",
        strArea: "Polish",
        strInstructions: "Soak herring in cold water for at least 1 hour. If very salty, repeat, changing the water each time.\r\n\r\nDrain thoroughly and slice herring into bite-size pieces.\r\n\r\nPlace in a jar large enough to accommodate the pieces and cover with oil, allspice, peppercorns, and bay leaf. Close the jar.\r\n\r\nRefrigerate for 2 to 3 days before eating. This will keep refrigerated up to 2 weeks.\r\n\r\nServe with finely chopped onion or onion slices, lemon, and parsley or dill.",
        strMealThumb: "https://www.themealdb.com/images/media/meals/7ttta31593350374.jpg",
        strYoutube: "https://www.youtube.com/watch?v=v6I3GZlBkOM",
        strIngredient1: "Herring",
        strIngredient2: "Onion",
        strIngredient3: "Olive Oil",
        strIngredient4: "Allspice",
        strIngredient5: "Pepper",
        strIngredient6: "Bay Leaf",
        strMeasure1: "8",
        strMeasure2: "1 sliced",
        strMeasure3: "1/2 cup ",
        strMeasure4: "1 tsp ",
        strMeasure5: "1 tsp ",
        strMeasure6: "1",
        strSource: "https://www.thespruceeats.com/polish-herrings-in-oil-recipe-1135618"
    )
    
}
