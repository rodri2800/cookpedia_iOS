//
//  NotificationType.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 10/04/23.
//

import Foundation
import SwiftUI

enum NotificationType{
    case bookmark
    case user
    case security
    case information
    case storage
    
    struct NotificationIcon{
        let icon:String
    }
    
    var icon:NotificationIcon{
        switch self{
            
        case .bookmark:
            return NotificationIcon(icon: "bookmark.fill")
        case .user:
            return NotificationIcon(icon: "person.fill")
        case .security:
            return NotificationIcon(icon: "checkmark.shield.fill")
        case .information:
            return NotificationIcon(icon: "info.square.fill")
        case .storage:
            return NotificationIcon(icon: "folder.fill")
        }
    }
    
    struct NotificationColor{
        let color:Color
    }
    
    var color:NotificationColor{
        switch self{
            
        case .bookmark:
            return NotificationColor(color: Color("NotificationBookmark"))
        case .user:
            return NotificationColor(color: Color("NotificationUser"))
        case .security:
            return NotificationColor(color: Color("NotificationSecurity"))
        case .information:
            return NotificationColor(color: Color("NotificationInformation"))
        case .storage:
            return NotificationColor(color: Color("NotificationStorage"))
        }
    }
    
}
