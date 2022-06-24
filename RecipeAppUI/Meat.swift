//
//  Meat.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/23.
//

import SwiftUI

struct Meat: View {
    let data: [StuffItem] = Bundle.main.decode("stuff-item.json")
    @ObservedObject var selectedItems: StuffItemArray = .shared
    
    var body: some View {
        let meat = Bundle.main.selectLabel("meat", data)
        VStack {
            Text("🥩肉类")
            Spacer()
            LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]) {
                ForEach(meat, id: \.self) { item in
                    Button(action: {
                        addSelectedItem(item)
                    }) {
                        Text("\(item.emoji)\(item.name)")
                    }
                    .buttonStyle(.bordered)
                    .frame(width: 100, height: 25)
                
                    Spacer()
                    
                }
                
            }
            Divider()
        }
        .foregroundColor(Color.red)
    }
    
    func addSelectedItem(_ item: StuffItem) {
        if !selectedItems.stuffItems.contains(item) {
            selectedItems.stuffItems.append(item)
        }
    }
    
}

struct Meat_Previews: PreviewProvider {
    static var previews: some View {
        Meat()
    }
}
