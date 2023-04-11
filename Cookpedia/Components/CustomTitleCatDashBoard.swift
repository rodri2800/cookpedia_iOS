//
//  CustomTitleCatDashBoard.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 09/04/23.
//

import SwiftUI

struct CustomTitleCatDashBoard: View {
    
    var title:String
    
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Button{
                
            }label: {
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(Color("PrimaryColor"))
            }
            
        }.padding()
        
    }
}

struct CustomTitleCatDashBoard_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitleCatDashBoard(
            title: "My bookmark"
        )
    }
}
