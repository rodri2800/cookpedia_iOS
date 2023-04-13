//
//  CustomCardCategory.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import SwiftUI

private struct BackgroundImageWithGradient: View {
    var url:URL
    var width:CGFloat?
    var height:Double
    
    var body: some View {
        ZStack{
            AsyncImage(url: url, content: { image in
                if width != nil{
                    image.resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                }else{
                    image.resizable()
                        .scaledToFill()
                        .frame(height: height)
                }
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



private struct NameCategory:View{
    var name:String
    
    var body: some View{
        HStack{
            Text(name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .padding(.bottom, -4.0)
            Spacer()
        }
    }
}





struct CustomCardCategory: View {
    
    var mealCategory:MealCategory
    var expanded:Bool = false
    
    var body: some View {
        VStack {
            if !expanded {
                NavigationLink(destination: CategoryView(category: mealCategory), label: {
                    ZStack{
                        //Imagen de fondo
                        BackgroundImageWithGradient(
                            url: mealCategory.strCategoryThumb,
                            width: 150,
                            height: 100
                        )
                        VStack(alignment: .leading){
                            Spacer()
                            NameCategory(name: mealCategory.strCategory)
                        }.frame(maxWidth: .infinity)
                            .padding(12)
                    }.frame(width: 150, height: 100)
                }
                )
            }
            else
            {
                ZStack{
                //Imagen de fondo
                BackgroundImageWithGradient(
                    url: mealCategory.strCategoryThumb,
                    height: 150
                )
                VStack(alignment: .leading){
                    Spacer()
                    NameCategory(name: mealCategory.strCategory)
                }.frame(maxWidth: .infinity)
                    .padding(12)
                }.frame(width: .infinity, height: 150)
                    .padding(.horizontal)
            }
        }
        
    }
}

struct CustomCardCategory_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardCategory(
            mealCategory: MealCategory.dummyData,
            expanded: false
        )
    }
}
