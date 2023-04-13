//
//  CategoryMealServices.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import Foundation
protocol CategoryMealService{
    func fetchListCategories() async throws -> [MealCategory]
    func fetchListMeals(category:String) async throws -> [Meal]
}

final class CategoryMealServiceImpl: CategoryMealService{
    
    func fetchListMeals(category: String) async throws -> [Meal] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("filter.php?c=\(category)"))
        let (data, _) = try await urlSession.data(from: url!)
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
        if let meals = json?["meals"] as? [[String:Any]] {
            let decoder = JSONDecoder()
            return try meals.map { try decoder.decode(Meal.self, from: try JSONSerialization.data(withJSONObject: $0, options: [])) }
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid JSON payload"))
        }
    }
    
    
    func fetchListCategories() async throws -> [MealCategory] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("categories.php"))
        let (data, _) = try await urlSession.data(from: url!)
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
        if let meals = json?["categories"] as? [[String:Any]] {
            let decoder = JSONDecoder()
            return try meals.map { try decoder.decode(MealCategory.self, from: try JSONSerialization.data(withJSONObject: $0, options: [])) }
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid JSON payload"))
        }
    }
    
    
    
}
