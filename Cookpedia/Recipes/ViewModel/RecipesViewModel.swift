//
//  RecipesViewModel.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 11/04/23.
//

import Foundation

protocol RecipesViewModel:ObservableObject{
    func getMeals() async
}


@MainActor
final class RecipesViewModelImpl:RecipesViewModel{
    @Published private(set) var listMealsYourRecipes = Set<Meal>()
    
    private let service:MealService
    
    
    init(service: MealService){
        self.service = service
    }
    
    func getMeals() async {
        do{
            if self.listMealsYourRecipes.isEmpty{
                self.listMealsYourRecipes = try await service.fetchListMeals(num: 15)
            }
        }catch{
            print("Error en Recipes: ")
        }
    }
    
    
}
