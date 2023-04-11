//
//  HomeView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 09/04/23.
//

import SwiftUI


private struct SectionMealView:View{
    var title:String
    var body: some View{
        VStack{
            CustomTitleCatDashBoard(title: title)
            ScrollView (.horizontal){
                HStack{
                    Spacer()
                    CustomCardMeal(
                        meal: Meal(
                            idMeal : "52874",
                            strMeal: "Beef and Mustard Pie",
                            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
                        )
                    )
                    CustomCardMeal(
                        meal: Meal(
                            idMeal: "52816",
                            strMeal: "Roasted Eggplant With Tahini, Pine Nuts, and Lentils",
                            strMealThumb: "https://www.themealdb.com/images/media/meals/ysqrus1487425681.jpg"
                        )
                    )
                    CustomCardMeal(
                        meal: Meal(
                            idMeal : "52874",
                            strMeal: "Beef and Mustard Pie",
                            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
                        )
                    )
                    CustomCardMeal(
                        meal: Meal(
                            idMeal : "52874",
                            strMeal: "Beef and Mustard Pie",
                            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
                        )
                    )
                    CustomCardMeal(
                        meal: Meal(
                            idMeal : "52874",
                            strMeal: "Beef and Mustard Pie",
                            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
                        )
                    )
                    CustomCardMeal(
                        meal: Meal(
                            idMeal : "52874",
                            strMeal: "Beef and Mustard Pie",
                            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
                        )
                    )
                    CustomCardMeal(
                        meal: Meal(
                            idMeal : "52874",
                            strMeal: "Beef and Mustard Pie",
                            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
                        )
                    )
                }
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Spacer()
                        .frame(height: 10)
                    CustomBanner()
                    SectionMealView(title: "Recent Recipes")
                    SectionMealView(title: "Your Recipes")
                    SectionMealView(title: "Your Bookmark")
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
