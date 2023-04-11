//
//  Meal.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 09/04/23.
//

import Foundation


class Meal: Hashable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    init(idMeal: String, strMeal: String, strMealThumb: String) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(idMeal)
    }
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.idMeal == rhs.idMeal
    }
}
