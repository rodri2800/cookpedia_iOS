//
//  HomeViewModel.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 11/04/23.
//

import Foundation

protocol HomeViewModel: ObservableObject{
    func getMeals() async
}

@MainActor
final class HomeViewModelImpl: HomeViewModel{
    
    @Published private(set) var listMealsRecentRecipes = Set<Meal>()
    @Published private(set) var listMealsYourRecipes = Set<Meal>()
    
    private let service:MealService
    
    
    init(service: MealService){
        self.service = service
    }
    
    func getMeals() async {
        do{
            if self.listMealsRecentRecipes.isEmpty{
                self.listMealsRecentRecipes = try await service.fetchListMeals(num: 10)
            }
            if self.listMealsYourRecipes.isEmpty{
                self.listMealsYourRecipes = try await service.fetchListMeals(num: 10)
            }
            
        }catch{
            print("Este es un error de HomeView: \(error)")
        }
    }
    
    
    
}
