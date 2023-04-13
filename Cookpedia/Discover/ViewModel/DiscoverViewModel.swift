//
//  DiscoverViewModel.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import Foundation

protocol DiscoverViewModel:ObservableObject{
    func getListCategories() async
}

@MainActor
final class DiscoverViewModelImpl:DiscoverViewModel{
    
    @Published private(set) var mealCategories = Array<MealCategory>()
    @Published private(set) var listMostPopular = Set<Meal>()
    @Published private(set) var listMealsRecommendations = Set<Meal>()
    @Published private(set) var listMealsSearch = Set<Meal>()
    @Published private(set) var listMealsRecipes = Set<Meal>()
    
    private let categoryService:CategoryMealService
    private let mealService:MealService
    
    init(categoryService:CategoryMealService, mealService:MealService){
        self.categoryService = categoryService
        self.mealService = mealService
    }
    
    
    func getListCategories() async {
        do{
            
            if listMostPopular.isEmpty{
                listMostPopular = try await mealService.fetchListMeals(num: 10)
            }
            if mealCategories.isEmpty{
                mealCategories = try await categoryService.fetchListCategories()
            }
            if listMealsRecommendations.isEmpty{
                listMealsRecommendations = try await mealService.fetchListMeals(num: 10)
            }
            if listMealsSearch.isEmpty{
                listMealsSearch = try await mealService.fetchListMeals(num: 10)
            }
            if listMealsRecipes.isEmpty{
                listMealsRecipes = try await mealService.fetchListMeals(num: 10)
            }
        }catch{
            print("Error en discover")
        }
    }
    
}
