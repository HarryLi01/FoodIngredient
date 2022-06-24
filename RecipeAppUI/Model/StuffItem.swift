//
//  StuffItem.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/22.
//

import Foundation

struct StuffItem: Codable, Equatable, Hashable {
    
    var name: String
    var emoji: String
    var image: String
    var alias: Bool
    var icon: String
    var label: String
    
    mutating func selectedToggle() {
        self.alias.toggle()
    }
    

}

