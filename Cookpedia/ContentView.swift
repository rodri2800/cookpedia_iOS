//
//  ContentView.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 09/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var mealSaved = CustomCardMealServiceImpl()
    
    var body: some View {
        NavigationStack{
            TabView{
                HomeView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }
                DiscoverView()
                    .tabItem{
                        Image(systemName: "safari")
                        Text("Discover")
                    }
                RecipesView()
                    .tabItem{
                        Image(systemName: "doc")
                        Text("My Recipes")
                    }
                ProfileView()
                    .tabItem{
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        }
        .environmentObject(mealSaved)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
