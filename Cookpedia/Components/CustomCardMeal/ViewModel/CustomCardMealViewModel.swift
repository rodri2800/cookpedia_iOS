//
//  CustomCardMealViewModel.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import Foundation


protocol CustomCardMealViewModel:ObservableObject{
    func addToBookmark(meal:Meal) async
}


@MainActor
final class CustomCardMealViewModelImpl:CustomCardMealViewModel{
    
    @Published private(set) var isSaved:Bool = false

    
    
    func addToBookmark(meal: Meal) {
        self.isSaved.toggle()
        
    }
    
    
}
