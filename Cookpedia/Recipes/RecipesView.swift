//
//  RecipesView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI

struct RecipesView: View {
    
    @StateObject private var viewModel = RecipesViewModelImpl(service: MealServiceImpl())
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20){
                if viewModel.listMealsYourRecipes.count > 0 {
                    
                    ForEach(Array(viewModel.listMealsYourRecipes), id:\.self) { meal in
                        CustomCardMeal(
                            meal: meal
                        )
                    }
                    
                }else{
                    ForEach(0..<15){
                        item in
                        ContainerShimmer()
                            .frame(width: 150, height: 210)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
                .task {
                    await viewModel.getMeals()
                    
                }
                .navigationTitle("My Recipes")
                
            
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView().environmentObject(CustomCardMealServiceImpl())
    }
}
