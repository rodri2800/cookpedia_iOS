//
//  MealCategory.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import Foundation

class MealCategory:Hashable, Codable{
    
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: URL
    let strCategoryDescription: String
        
    init(idCategory: String, strCategory: String, strCategoryThumb: String, strCategoryDescription: String) {
        self.idCategory = idCategory
        self.strCategory = strCategory
        self.strCategoryThumb = URL(string: strCategoryThumb)!
        self.strCategoryDescription = strCategoryDescription
    }
    
    
    func hash(into hasher: inout Hasher){
        hasher.combine(idCategory)
    }
    
    
    static func == (lhs: MealCategory, rhs: MealCategory) -> Bool {
        return lhs.idCategory == rhs.idCategory
    }
    
    
    
}

extension MealCategory{
    static let dummyData = MealCategory(
        idCategory: "14",
        strCategory: "Goat",
        strCategoryThumb: "https://www.themealdb.com/images/category/goat.png",
        strCategoryDescription: "The domestic goat or simply goat (Capra aegagrus hircus) is a subspecies of C. aegagrus domesticated from the wild goat of Southwest Asia and Eastern Europe. The goat is a member of the animal family Bovidae and the subfamily Caprinae, meaning it is closely related to the sheep. There are over 300 distinct breeds of goat. Goats are one of the oldest domesticated species of animal, and have been used for milk, meat, fur and skins across much of the world. Milk from goats is often turned into goat cheese."
    )
}
