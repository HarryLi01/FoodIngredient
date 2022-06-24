//
//  Recipe.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/22.
//

import Foundation
import SwiftUI

struct Recipe: Codable, Identifiable, Hashable {
    let name: String
    let stuff: String
    let link: String
    let difficulty: String
    let tags: String
    let methods: String
    let tools: String
    let id: String
}
