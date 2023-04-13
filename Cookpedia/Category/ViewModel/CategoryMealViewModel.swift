//
//  CategoryMealViewModel.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import Foundation

protocol CategoryMealViewModel:ObservableObject{
    func getMeals(category:String) async
}


@MainActor
final class CategoryMealViewModelImpl:CategoryMealViewModel{
    
    @Published private(set) var meals = Array<Meal>()
    
    private var service:CategoryMealService
    
    init(service: CategoryMealService) {
        self.service = service
    }
    
    func getMeals(category: String) async {
        do{
            if meals.isEmpty{
                self.meals = try await service.fetchListMeals(category: category)
            }
        }catch{
            print("Error en category")
        }
    }
    
    
}

