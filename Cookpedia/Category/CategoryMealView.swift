//
//  CategoryView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import SwiftUI

private struct CategoryDescription:View{
    
    var description:String
    
    var body: some View{
        Text(description)
            .font(.subheadline)
            .padding()
    }
}

private struct RecipesCategory:View{
    
    var meals:[Meal]?
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View{
        VStack{
            HStack{
                Text("Recipes")
                    .font(.headline)
                Spacer()
            }.padding()
            if meals != nil{
                LazyVGrid(columns: adaptiveColumns, spacing: 20){
                    ForEach(meals!, id: \.self){
                        meal in
                        CustomCardMeal(meal: meal)
                    }
                }
            }
        }
    }
}

struct CategoryView: View {
    
    @StateObject private var viewModel = CategoryMealViewModelImpl(service: CategoryMealServiceImpl())
    
    var category:MealCategory
    
    var body: some View {
        ScrollView{
            VStack{
                CustomCardCategory(
                    mealCategory: category,
                    expanded: true
                )
                CategoryDescription(description: category.strCategoryDescription)
                RecipesCategory(
                    meals: viewModel.meals
                )
            }
        }.navigationTitle(category.strCategory)
            .task {
                await viewModel.getMeals(category: category.strCategory)
            }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(
            category: MealCategory.dummyData
        ).environmentObject(CustomCardMealServiceImpl())
    }
}
