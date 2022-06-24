//
//  StuffItemArray.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/29.
//

import Foundation

class StuffItemArray: ObservableObject {
        
    static let shared = StuffItemArray()
    
    @Published var stuffItems = [StuffItem]()
    
    private init() {
        
    }
}
