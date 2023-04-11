//
//  MealView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI


private struct MealImage:View{
    let url:String
    var body: some View{
        AsyncImage(url: URL(string: url), content: { image in
            image.resizable()
                .scaledToFill()
                .frame(height: 280)
            
        }, placeholder: {
            ProgressView()
        })
        
    }
}

private struct TitleMeal:View{
    
    let name:String
    
    var body: some View{
        Text(name)
            .padding(.top, 70.0)
            .font(.title)
    }
}

private struct Description:View{
    
    var category:String?
    var area:String?
    
    var body: some View{
        
        HStack(spacing: 12){
            if category != nil{
                CustomLabelInfoMeal(
                    type: "Category",
                    icon: "tag.fill",
                    info: category!)
            }
            
            if area != nil{
                CustomLabelInfoMeal(
                    type: "Area",
                    icon: "location",
                    info: area!)
            }
        }
        
    }
}

private struct Ingredients:View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Ingredients:")
                .font(.title2)
                .fontWeight(.bold)
            CustomStepInfo(
                numstep: 1,
                description: "1 head of lettuce, chopped"
            )
            CustomStepInfo(
                numstep: 2,
                description: "1 head of lettuce, chopped"
            )
            CustomStepInfo(
                numstep: 3,
                description: "1 head of lettuce, chopped"
            )
        }.frame(maxWidth: .infinity)
    }
}

private struct Instructions:View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Instructions:")
                .font(.title2)
                .fontWeight(.bold)
            CustomStepInfo(
                numstep: 1,
                description: "Stir the water starch and then pour half of the mixture to the simmering pot. Wait for around 30 seconds and then pour the other half. You can slightly taste the tofu and add pinch of salt if not salty enough. By the way, if you feel it is too spicy, add some sugar can milder the taste. But be carefully as the broth is very hot at this point."
            )
            CustomStepInfo(
                numstep: 2,
                description: "1 head of lettuce, chopped"
            )
            CustomStepInfo(
                numstep: 3,
                description: "1 head of lettuce, chopped"
            )
        }.frame(maxWidth: .infinity)
    }
}


struct MealView: View {
    
    var meal:Meal
    
    var body: some View {
        ScrollView {
            VStack{
                MealImage(url: meal.strMealThumb)
                VStack {
                    TitleMeal(name: meal.strMeal)
                    Divider()
                    CustomInfoCardUser(
                        nameUser: "Jane Copper",
                        idUser: "@jane_copper")
                    Divider()
                    Description(
                        category: "Beef",
                        area: "Chinese"
                    )
                    Divider()
                    Ingredients()
                    Divider()
                    Instructions()
                }.padding()
                
            }
        }
        .toolbar{
            Button{
                
            }label: {
                Image(systemName: "bookmark")
            }
            Button{
                
            }label: {
                Image(systemName: "square.and.arrow.up")
            }
            Button{
                
            }label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(meal: Meal(
            idMeal : "52874",
            strMeal: "Beef and Mustard Pie",
            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
        ))
    }
}
