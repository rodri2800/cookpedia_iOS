//
//  CustomLabelInfoMeal.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI

struct CustomLabelInfoMeal: View {
    
    var type:String
    var icon:String
    var info:String
    
    var body: some View {
        VStack(spacing: 4){
            HStack{
                Image(systemName: icon)
                    .foregroundColor(Color.accentColor)
                Text(info)
                    .foregroundColor(.accentColor)
                    .font(.headline)
                    .fontWeight(.medium)
                    
            }
            Text(type)
                .foregroundColor(Color.gray)
                .font(.caption)
                .fontWeight(.bold)
        }.frame(width: 120, height: 60)
            .background(Color.accentColor.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CustomLabelInfoMeal_Previews: PreviewProvider {
    static var previews: some View {
        CustomLabelInfoMeal(
            type: "Category",
            icon: "tag.fill",
            info: "Beef"
        )
    }
}
