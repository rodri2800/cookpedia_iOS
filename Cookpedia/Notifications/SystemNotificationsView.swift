//
//  SystemNotificationsView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 11/04/23.
//

import SwiftUI

struct SystemNotificationsView:View{
    var body: some View{
        ScrollView{
            VStack{
                CustomCardSystemNotification(
                    type: .information,
                    title: "Security Updates!",
                    //read: true,
                    information: "Now Cookpedia has a Two-Factor Authencatication. Try it now to make your account more."
                )
                CustomCardSystemNotification(
                    type: .bookmark,
                    title: "Security Updates!",
                    read: true,
                    information: "Now Cookpedia has a Two-Factor Authencatication. Try it now to make your account more."
                )
                CustomCardSystemNotification(
                    type: .security,
                    title: "Security Updates!",
                    //read: true,
                    information: "Now Cookpedia has a Two-Factor Authencatication. Try it now to make your account more."
                )
            }.padding()
        }
    }
}

struct SystemNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        SystemNotificationsView()
    }
}
