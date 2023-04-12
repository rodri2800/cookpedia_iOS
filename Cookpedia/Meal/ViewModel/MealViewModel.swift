//
//  MealViewModel.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 11/04/23.
//

import Foundation


protocol MealViewModel: ObservableObject{
    func getInfoMeal(id:String) async
}

@MainActor
final class MealViewModelImpl: MealViewModel{
    
    @Published private(set) var detailsMeal:DetailsMeal = DetailsMeal()
    
    @Published private(set) var isLoading:Bool = true
    
    private let service:MealService
    
    init(service: MealService) {
        self.service = service
    }
    
    
    func getInfoMeal(id:String) async {
        do{
            self.isLoading = true
            self.detailsMeal = try await service.fetchMeal(id: id)
            self.isLoading = false
        }catch{
            print("Este es un error: \(error)")
        }
    }
    
    
    
    
}
