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
            
    }
}

struct CustomBanner_Previews: PreviewProvider {
    static var previews: some View {
        CustomBanner()
    }
}
