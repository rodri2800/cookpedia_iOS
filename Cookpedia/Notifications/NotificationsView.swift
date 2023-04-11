//
//  NotificationsView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI


private struct SystemNotificationsView:View{
    var body: some View{
        ScrollView{
            VStack{
                CustomCardSystemNotification(
                    type: .user,
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

private struct GeneralNotificationsView:View{
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

struct NotificationsView: View {
    
    var body: some View {
        NavigationStack{
            TabView{
                GeneralNotificationsView()
                    .tabItem{
                        Text("General")
                    }
                SystemNotificationsView()
                    .tabItem{
                        Text("System")
                    }
            }
        }
        .navigationTitle("Notification")
        .toolbar{
            Button{
                
            }label: {
                Image(systemName: "gearshape")
                    .foregroundColor(Color("ColorFontIcons"))
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
