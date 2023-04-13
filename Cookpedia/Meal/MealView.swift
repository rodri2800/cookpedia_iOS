//
//  MealView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI


private struct MealImage:View{
    
    @State private var paddingTop:CGFloat = 0
    
    let url:String?
    
    
    var body: some View{
        
            
        if let url {
            AsyncImage(url: URL(string: url), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 280)
                    .padding(.top, -paddingTop)
            }, placeholder: {
                ContainerShimmer()
                    .frame(height: 280)
                    .scaledToFill()
            })
            
        }else{
            ContainerShimmer()
                .frame(height: 280)
                .scaledToFill()
        }
        
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
    
    var ingredients:Array<String> = []
    
    var body: some View{
        
        VStack(alignment: .leading){
            Text("Ingredients:")
                .font(.title2)
                .fontWeight(.bold)
            ForEach(Array(ingredients.enumerated()), id:\.1){
                index, item in
                CustomStepInfo(numstep: (index+1), description: item)
            }
        }.frame(maxWidth: .infinity)
    }
}

private struct Instructions:View{
    
    var instructions:Array<String> = []
    
    var body: some View{
        VStack(alignment: .leading){
            Text("Instructions:")
                .font(.title2)
                .fontWeight(.bold)
            ForEach(Array(instructions.enumerated()), id: \.1){
                index, instruction in
                CustomStepInfo(
                    numstep: (index+1),
                    description: instruction
                )
            }
            
        }.frame(maxWidth: .infinity)
    }
}


struct MealView: View {
    
    @StateObject private var viewModel = MealViewModelImpl(service: MealServiceImpl())
    
    @EnvironmentObject private var mealSaved:CustomCardMealServiceImpl
    
    var meal:Meal
    
    //var detailsMeal:DetailsMeal = DetailsMeal.dummyData
    
    var body: some View {
        ScrollView {
            VStack{
                MealImage(url: viewModel.detailsMeal.strMealThumb)
                VStack {
                    TitleMeal(name: viewModel.detailsMeal.strMeal ?? "Sin info")
                    Divider()
                    CustomInfoCardUser(
                        nameUser: "Jane Copper",
                        idUser: "@jane_copper")
                    Divider()
                    if viewModel.isLoading==false{
                        Description(
                            category: viewModel.detailsMeal.strCategory ?? "Sin info",
                            area: viewModel.detailsMeal.strArea ?? "Sin info"
                        )
                        Divider()
                        Ingredients(
                            ingredients: viewModel.detailsMeal.getIngredientList()
                        )
                        Divider()
                        Instructions(
                            instructions: viewModel.detailsMeal.splitInstructions()
                        )
                    }
                }.padding()
                
            }
        }
        .toolbar{
            Button{
                if mealSaved.mealsSaved.contains(meal){
                    mealSaved.removeMeal(meal: meal)
                }else{
                    mealSaved.saveMeal(meal: meal)
                }
            }label: {
                Image(systemName: mealSaved.mealsSaved.contains(meal) ?  "bookmark.fill" : "bookmark")
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
        .task {
            await viewModel.getInfoMeal(id:meal.idMeal)
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(meal: Meal(
            idMeal : "53050",
            strMeal: "Beef and Mustard Pie",
            strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
        )).environmentObject(CustomCardMealServiceImpl())
    }
}
