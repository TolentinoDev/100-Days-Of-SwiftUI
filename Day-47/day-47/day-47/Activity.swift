//
//  Activity.swift
//  day-47
//
//  Created by Ryan Tolentino on 7/22/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import Foundation
import SwiftUI

struct Activity: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    var completed: Int = 0
    
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.title == rhs.title
        
    }
}
