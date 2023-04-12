//
//  CustomCardMealService.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import Foundation

protocol CustomCardMealService{
    func saveMeal(meal:Meal) async
    func getAllMeals() async
    func removeMeal(meal:Meal) async
}

@MainActor
class CustomCardMealServiceImpl: CustomCardMealService,ObservableObject{
    
    @Published private(set) var mealsSaved = Array<Meal>()
    
    
    init() {
        getAllMeals()
    }
    
    func saveMeal(meal: Meal) {
        mealsSaved.insert(meal, at: 0)
        encondedAndSavedMeals()
    }
    
    private func encondedAndSavedMeals(){
        if let encoded = try? JSONEncoder().encode(mealsSaved){
            UserDefaults.standard.set(encoded, forKey: "meals")
        }
    }
    
    func getAllMeals(){
        if let mealsData = UserDefaults.standard.object(forKey: "meals") as? Data{
            mealsSaved = try! JSONDecoder().decode([Meal].self, from: mealsData)
        }
    }
    
    func removeMeal(meal: Meal) {
        if let index = mealsSaved.firstIndex(of: meal){
            mealsSaved.remove(at: index)
        }
        encondedAndSavedMeals()
    }
    
    
}
