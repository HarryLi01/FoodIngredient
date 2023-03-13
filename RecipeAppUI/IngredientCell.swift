//
//  IngredientCell.swift
//  食材食用手册
//
//  Created by Li Li on 2023/3/13.
//

import SwiftUI

struct IngredientCell: View {
    @ObservedObject var selectedItems: StuffItemArray = .shared
    @State var isSelected: Bool = false
    var item: StuffItem
    
    var body: some View {
        Button(action: {
            addSelectedItem(item)
        }) {
            Text("\(item.emoji)\(item.name)")
        }
        .frame(width: 200, height: 25)
    }
    
    func addSelectedItem(_ item: StuffItem) {
        if !selectedItems.stuffItems.contains(item) {
            selectedItems.stuffItems.append(item)
        }
    }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell(item: StuffItem(name: "", emoji: "", image: "", alias: false, icon: "", label: ""))
    }
}
