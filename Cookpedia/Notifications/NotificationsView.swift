//
//  NotificationsView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import SwiftUI






struct NotificationsView: View {
    
    var body: some View {
        NavigationStack{
            TabView{
                GeneralNotificationsView()
                    .tabItem{
                        Image(systemName: "doc.fill")
                        Text("General")
                    }
                SystemNotificationsView()
                    .tabItem{
                        Image(systemName: "gear.circle.fill")
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
