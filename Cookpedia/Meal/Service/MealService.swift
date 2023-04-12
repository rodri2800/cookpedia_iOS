//
//  MealService.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 11/04/23.
//

import Foundation


protocol MealService{
    func fetchMeal(id:String) async throws -> DetailsMeal
    func fetchListMeals(num:Int) async throws -> Set<Meal>
}


final class MealServiceImpl: MealService{
    
    func fetchListMeals(num:Int) async throws -> Set<Meal> {
        
        var meals = Set<Meal>()
        
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("random.php"))
        for _ in 0..<num{
            let (data, _) = try await urlSession.data(from: url!)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            if let meals2 = json?["meals"] as? [[String:Any]] {
                let decoder = JSONDecoder()
                let meal =  try meals2.map { try decoder.decode(Meal.self, from: try JSONSerialization.data(withJSONObject: $0, options: [])) }
                meals = meals.union(Set(meal))
            } else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid JSON payload"))
            }
            
        }
        return meals
    }
    
    
    func fetchMeal(id:String) async throws -> DetailsMeal {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("lookup.php?i=\(id)"))
        let (data, _) = try await urlSession.data(from: url!)
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
        if let meals = json?["meals"] as? [[String:Any]] {
            let decoder = JSONDecoder()
            return try meals.map { try decoder.decode(DetailsMeal.self, from: try JSONSerialization.data(withJSONObject: $0, options: [])) }.first!
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid JSON payload"))
        }
    }
    
    
    
}
