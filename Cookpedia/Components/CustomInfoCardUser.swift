//
//  CustomInfoCardUser.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI


private struct ImageUser:View{
    var body: some View{
        Image("daniel")
            .resizable()
            .scaledToFill()
            .frame(width: 76, height: 76)
            .clipShape(Circle())
    }
}

private struct InfoUser:View{
    
    var nameUser:String
    var idUser:String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8.0){
            Text(nameUser)
                .fontWeight(.bold)
                .font(.title3)
            Text(idUser)
                .foregroundColor(Color.gray)
                .font(.subheadline)
        }
    }
}

private struct FollowButton:View{
    var body: some View{
        Text("Follow")
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .font(.system(size: 12))
            .padding(.horizontal, 18.0)
            .padding(.vertical, 8.0)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct CustomInfoCardUser: View {
    
    var nameUser:String
    var idUser:String
    
    var body: some View {
        HStack(spacing: 15.0){
            ImageUser()
            InfoUser(nameUser: nameUser, idUser: idUser)
            Spacer()
            FollowButton()
        }
    }
}

struct CustomInfoCardUser_Previews: PreviewProvider {
    static var previews: some View {
        CustomInfoCardUser(
            nameUser: "Jane Copper",
            idUser: "@jane_copper")
    }
}
