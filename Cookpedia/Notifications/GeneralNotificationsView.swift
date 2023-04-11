//
//  GeneralNotificationsView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 11/04/23.
//

import SwiftUI

struct GeneralNotificationsView:View{
    var body: some View{
        ScrollView{
            VStack{
                CustomCardGeneralNotification()
                CustomCardGeneralNotification()
                CustomCardGeneralNotification()
                CustomCardGeneralNotification()
            }
        }.padding()
    }
}

struct GeneralNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralNotificationsView()
    }
}
