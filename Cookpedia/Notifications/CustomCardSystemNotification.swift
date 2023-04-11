//
//  CustomCardSystemNotification.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI


private struct CustomIcon:View{
    
    var icon:String
    var color:Color
    
    var body: some View{
        Image(systemName: icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(20)
            .frame(width: 65, height: 65)
            .foregroundColor(color)
            .background(color.opacity(0.2))
            .clipShape(Circle())
            
    }
}



private struct InfoNotification:View{
    
    var title:String
    var day:Int
    var time:String
    
    private var textDay:String{
        if day==0{
            return "Today"
        }else if day > 0{
            return "\(day) day ago"
        }else{
            return "Sin info"
        }
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            Text("\(textDay) | \(time)")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}

private struct NewLabel:View{
    var body: some View{
        Text("New")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(.horizontal, 8.0)
            .padding(.vertical, 4.0)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 6))

    }
}

struct CustomCardSystemNotification: View {
    
    var type: NotificationType
    var title: String
    var read: Bool = false
    var information: String
    
    
    var body: some View {
        VStack{
            HStack(spacing: 12){
                CustomIcon(
                    icon: type.icon.icon,
                    color: type.color.color
                )
                InfoNotification(
                    title: title,
                    day: 2,
                    time: "09:24 AM"
                )
                Spacer()
                if(!read){
                    NewLabel()
                }
            }
            Text(information)
        }
        
    }
}

struct CustomCardSystemNotification_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardSystemNotification(
            type: .user,
            title: "Security Updates!",
            information: "Now Cookpedia has a Two-Factor Authencatication. Try it now to make your account more."
        )
    }
}
