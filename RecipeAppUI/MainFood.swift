//
//  MainFood.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/23.
//

import SwiftUI

struct MainFood: View {
    let data: [StuffItem] = Bundle.main.decode("stuff-item.json")
    @ObservedObject var selectedItems: StuffItemArray = .shared

    var body: some View {
        let main: [StuffItem] = Bundle.main.selectLabel("main", data)
        VStack {
            Text("🍚主食")
            HStack {
                ForEach(main, id: \.self) { item in
                    Button(action: {
                        addSelectedItem(item)
                    }) {
                        Text("\(item.emoji)\(item.name)")
                    }
                    .buttonStyle(.bordered)
                }
            }
            Spacer()
            Divider()

        }
    }
    func addSelectedItem(_ item: StuffItem) {
        if !selectedItems.stuffItems.contains(item) {
            selectedItems.stuffItems.append(item)
        }
    }
}

struct MainFood_Previews: PreviewProvider {
    static var previews: some View {
        MainFood()
    }
}
