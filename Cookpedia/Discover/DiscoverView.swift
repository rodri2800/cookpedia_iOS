//
//  DiscoverView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI

private struct MealsSection:View{
    var title:String
    
    var meals:Set<Meal>?
    
    var body: some View{
        VStack{
            CustomTitleCatDashBoard(title: title)
            ScrollView(.horizontal) {
                HStack{
                    Spacer()
                    if meals != nil && meals?.count ?? 0 > 0 {
                        ForEach(Array(meals!), id: \.self){
                            meal in
                            CustomCardMeal(meal: meal)
                        }
                    }else{
                        ForEach(0..<10) { item in
                            ContainerShimmer()
                                .frame(width: 150, height: 210)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
        }
        
    }
}

private struct RecipeCategoriesSection:View{
    
    var categories:[MealCategory]?
    
    var body: some View{
        VStack{
            CustomTitleCatDashBoard(title: "Recipe Categories")
            ScrollView(.horizontal) {
                HStack{
                    Spacer()
                    if categories != nil && categories?.count ?? 0 > 0 {
                        ForEach(Array(categories!), id: \.self){
                            category in
                            CustomCardCategory(mealCategory: category)
                        }
                    }else{
                        ForEach(0..<10) { item in
                            ContainerShimmer()
                                .frame(width: 150, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
        }
    }
}

private struct TopChefsSection:View{
    var body: some View{
        VStack{
            CustomTitleCatDashBoard(title: "Top Chefs")
            ScrollView(.horizontal) {
                HStack{
                    Spacer()
                    ForEach(0..<10) { item in
                        CustomCardChef()
                    }
                }
            }
        }
    }
}

struct DiscoverView: View {
    
    @StateObject private var viewModel = DiscoverViewModelImpl(
        categoryService: CategoryMealServiceImpl(),
        mealService: MealServiceImpl()
    )
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    MealsSection(
                        title: "Most Popular",
                        meals: viewModel.listMostPopular
                    )
                    RecipeCategoriesSection(
                        categories: viewModel.mealCategories
                    )
                    TopChefsSection()
                    MealsSection(
                        title: "Our recommendations",
                        meals: viewModel.listMealsRecommendations
                    )
                    MealsSection(
                        title: "Most Searchs",
                        meals: viewModel.listMealsSearch
                    )
                    MealsSection(
                        title: "New Recipes",
                        meals: viewModel.listMealsRecipes
                    )
                }
            }.navigationTitle("Discover")
                
                .task {
                    await viewModel.getListCategories()
                }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView().environmentObject(CustomCardMealServiceImpl())
    }
}
