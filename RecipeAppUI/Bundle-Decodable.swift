//
//  Bundle-Decodable.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/23.
//

import Foundation
import SwiftUI

extension Bundle {
    func selectLabel(_ label: String, _ data: [StuffItem]) -> [StuffItem] {
        var stuffItem = [StuffItem]()
        for item in data {
            if item.label == label {
                stuffItem.append(item)
            }
        }
        return stuffItem
    }
}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            fatalError("There is an error processing url.")
        }
        let decoder = JSONDecoder()
        guard let data = try? Data(contentsOf: url) else {
            fatalError("There is an error processing data.")
        }
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("There is an error processing loaded.")
        }
        return loaded
    }
}

extension Array {
    func removeStringItem(array: [String], item: String) -> [String] {
        var arrayCopy = array
        var index = 0
        var flag = false
        for i in arrayCopy {
            if item == i {
                flag = true
            }
            if flag {
                arrayCopy.remove(at: index)
            }
            index += 1
        }
        return arrayCopy
    }
    
    func getArrayIndex(array: [String], item: String) -> Int {
        var index = 0
        for i in array {
            if i == item {
                return index
            }
            index += 1
        }
        return -1
    }
}

