//
//  CustomStepInfo.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI

struct CustomStepInfo: View {
    
    var numstep:Int
    var description:String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8.0){
            Text("\(numstep)")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.accentColor)
                .fontWeight(.bold)
                .frame(width: 30, height: 30)
                .background(Color.accentColor.opacity(0.2))
                .clipShape(Circle())
            Text(description)
                .padding(.top, 5.5)
            Spacer()
        }
    }
}

struct CustomStepInfo_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepInfo(
            numstep: 1,
            description: "1 head of lettuce, chopped"
        )
    }
}
