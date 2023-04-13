//
//  HomeView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 09/04/23.
//

import SwiftUI


private struct SectionMealView:View{
    
    var title:String
    
    var meals:Set<Meal>?
    
    var body: some View{
        VStack{
            CustomTitleCatDashBoard(title: title)
            ScrollView (.horizontal){
                HStack{
                    Spacer()
                    
                    if meals != nil && meals?.count ?? 0 > 0 {
                        
                        ForEach(Array(meals!), id:\.self) { meal in
                            CustomCardMeal(
                                meal: meal
                            )
                        }
                        
                    }else{
                        ForEach(0..<10){
                            item in
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

private struct SectionBookmarkMealView:View{
    
    var title:String
    
    var meals:Array<Meal>?
    
    var body: some View{
        VStack{
            CustomTitleCatDashBoard(title: title)
            if meals != nil && meals?.count ?? 0 > 0 {
                ScrollView(.horizontal){
                    HStack{
                        Spacer()
                        ForEach(Array(meals!), id:\.self) { meal in
                            CustomCardMeal(
                                meal: meal
                            )
                        }

                    }
                }
                
                                        
            }else{
                Text("Sin recetas guardadas")
                    .frame(width: 150, height: 210)
            }
        }
    }
}


struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModelImpl(service: MealServiceImpl())

    @EnvironmentObject var mealSaved:CustomCardMealServiceImpl
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Spacer()
                        .frame(height: 10)
                    CustomBanner()
                    SectionMealView(title: "Recent Recipes", meals: viewModel.listMealsRecentRecipes)
                    SectionMealView(title: "Your Recipes", meals: viewModel.listMealsYourRecipes)
                    SectionBookmarkMealView(title: "Your Bookmark", meals: mealSaved.mealsSaved)
                }
            }
            .navigationTitle("Cookpedia")
            .toolbar{
                NavigationLink(
                    destination: NotificationsView(),
                    label: {
                        Image(systemName: "bell")
                            .foregroundColor(Color("ColorFontIcons"))
                    }
                )
                NavigationLink(
                    destination: BookmarkView(),
                    label: {
                        Image(systemName: "bookmark")
                            .foregroundColor(Color("ColorFontIcons"))
                    }
                )
            }
        }
        .task {
            await viewModel.getMeals()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(CustomCardMealServiceImpl())
    }
}
