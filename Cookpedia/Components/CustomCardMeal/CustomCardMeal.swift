//
//  CustomCardMeal.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 09/04/23.
//

import SwiftUI


private struct BackgroundImageWithGradient: View {
    var url:String
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string:url), content: { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 210)
                    
            }, placeholder: {
                ProgressView()
            })
            LinearGradient(gradient: Gradient(
                stops: [
                    .init(color: Color.black.opacity(0), location: 0),
                    .init(color: Color.black.opacity(0.1), location: 0.25),
                    .init(color: Color.black.opacity(0.2), location: 0.5),
                    .init(color: Color.black, location: 1)
                ]
            ), startPoint: .top, endPoint: .bottom)
        }.clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

private struct ButtonAdd:View{
    
    var saved:Bool
    var action: () -> Void
    
    var body: some View{
        HStack{
            Spacer()
            Button(action: action, label: {
                Image(systemName: saved ? "bookmark.fill" : "bookmark" )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12)
                    .padding(12)
                    .foregroundColor(Color.white)
                    .background(Color("PrimaryColor"))
                    .clipShape(Circle())
            })
        }
    }
}


private struct NameMeal:View{
    var name:String
    
    var body: some View{
        Text(name)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(.bottom, -4.0)
            .frame(maxWidth: .infinity)
    }
}

private struct UserInfo:View{
    var body: some View{
        HStack{
            Image("perfil")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 36)
                .clipShape(Circle())
            Text("Jane Cooper")
                .font(.subheadline)
                .foregroundColor(Color.white)
        }
    }
}

struct CustomCardMeal: View {
    
    @EnvironmentObject private var mealSaved:CustomCardMealServiceImpl
    
    @StateObject private var viewModel = CustomCardMealViewModelImpl()
    
    var meal:Meal
    
    var body: some View {
        NavigationLink(
            destination: MealView(meal: meal),
            label: {
                ZStack{
                    //Imagen de fondo
                    BackgroundImageWithGradient(url: meal.strMealThumb)
                    
                    VStack(){
                        ButtonAdd(
                            saved: mealSaved.mealsSaved.contains(meal)
                        ){
                            if mealSaved.mealsSaved.contains(meal){
                                mealSaved.removeMeal(meal: meal)
                            }else{
                                mealSaved.saveMeal(meal: meal)
                            }
                        }
                        Spacer()
                        NameMeal(name: meal.strMeal)
                        UserInfo()
                    }.frame(maxWidth: .infinity)
                        .padding(8)
                    
                }.frame(width: 150, height: 210)
            })
        
    }
}

struct CustomCardMeal_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardMeal(
            meal: Meal(
                idMeal : "52874",
                strMeal: "Beef and Mustard Pie",
                strMealThumb : "https://www.themealdb.com/images/media/meals/ysqrus1487425681.jpg"
            )
        ).environmentObject(CustomCardMealServiceImpl())
    }
}


