//
//  CustomCardGeneralNotification.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI


private struct UserImage:View{
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            Image("perfil")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            Spacer()
                .background(Color.red)
                .clipShape(Circle())
                .frame(width: 12, height: 12)
                .padding(3)
                .background(Color("ColorBackground"))
                .clipShape(Circle())
        }.frame(width: 60, height: 60)
    }
}

private struct NotificationInfo:View{
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Jane Cooper has published a new recipe!")
                .font(.title3)
                .fontWeight(.bold)
            Text("Today | 09:24 AM")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}

private struct MealImage:View{
    var body: some View{
        Image("pizzademo")
            .resizable()
            .scaledToFill()
            .frame(width: 72, height: 72)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
    }
}

private struct NotificationDetails:View{
    var body: some View{
        Image(systemName: "ellipsis")
            .rotationEffect(.degrees(90))
        
    }
}

struct CustomCardGeneralNotification: View {
    var body: some View {
        HStack(spacing: 10){
            UserImage()
            NotificationInfo()
            Spacer()
            MealImage()
            NotificationDetails()
        }
        
    }
}

struct CustomCardGeneralNotification_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardGeneralNotification()
    }
}
