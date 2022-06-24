//
//  vegetable.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/21.
//

import SwiftUI

struct Vegetable: View {
    let recipes: [Recipe] = Bundle.main.decode("recipe.json")
    var stuffItem: [StuffItem] = Bundle.main.decode("stuff-item.json")
    @ObservedObject var selectedItems: StuffItemArray = .shared
    var body: some View {
        let vegetables = Bundle.main.selectLabel("vegetable", stuffItem)
        VStack {
            Spacer()
            Text("🥬 蔬菜")
            Spacer()
            LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]) {
                ForEach(vegetables, id: \.self) { item in
                    
                    Button(action: {
                        addSelectedItem(item)
                        
                    }) {
                        Text("\(item.emoji)\(item.name)")
                    }
                    .frame(width: 200, height: 25)
                    .buttonStyle(.bordered)
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            Divider()
        }
        .foregroundColor(.green)
    }
    
    func addSelectedItem(_ item: StuffItem) {
        if !selectedItems.stuffItems.contains(item) {
            selectedItems.stuffItems.append(item)
        }
    }
    

}

struct Vegetable_Previews: PreviewProvider {
    @ObservedObject var selectedItems: StuffItemArray = .shared
    static var previews: some View {
        Vegetable()
    }
}
