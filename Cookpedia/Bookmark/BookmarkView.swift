//
//  BookmarkView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI

private var meals:Array<Meal> = [
    Meal(
        idMeal : "52874",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52875",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52876",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52877",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52878",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52879",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52880",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52881",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52882",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52883",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52884",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    ),
    Meal(
        idMeal : "52885",
        strMeal: "Beef and Mustard Pie",
        strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
    )
]

struct BookmarkView: View {
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 20){
                ForEach(meals, id: \.self){
                    meal in
                    CustomCardMeal(meal: meal)
                }
            }
        }
        .navigationTitle("My Bookmark")
        .toolbar{
            Button{
                
            }label: {
                Image(systemName: "gearshape")
                    .foregroundColor(Color("ColorFontIcons"))
            }
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
