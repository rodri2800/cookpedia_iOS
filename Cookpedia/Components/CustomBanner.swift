//
//  CustomBanner.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 09/04/23.
//

import SwiftUI

struct CustomBanner: View {
    var body: some View {
        Image("bannerimage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 350)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(color: Color.accentColor.opacity(0.4), radius: 5, y: 4)
            
    }
}

struct CustomBanner_Previews: PreviewProvider {
    static var previews: some View {
        CustomBanner()
    }
}
