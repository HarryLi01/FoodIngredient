//
//  Result.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/23.
//

import SwiftUI

struct Result: View {
    let recipeData: [Recipe] = Bundle.main.decode("recipe.json")
    var allStuffItems: [StuffItem] = Bundle.main.decode("stuff-item.json")
    @ObservedObject var selectedItems: StuffItemArray = .shared
    private var modeArray = ["模糊匹配", "严格匹配"]
    @State private var selectedMode = "模糊匹配"
    @State private var availableRecipes = [Recipe]()
    @State private var isMatched = true
    @State private var isShowing = false
    @State private var showingWipeOutAlert = false
    private var reverseSelectedItems: [StuffItem] {
        var reverse: [StuffItem] = allStuffItems
        var index: Int
        for item in selectedItems.stuffItems {
            index = reverse.firstIndex(of: item) ?? 0
            reverse.remove(at: index)
        }
        return reverse
    }
    
    var body: some View {
        VStack {
            Text("已选择的食材:")
            if selectedItems.stuffItems.count == 0 {
                Text("未选择食材")
                    .font(.caption)
                    .foregroundColor(.red)
            } else {
                ForEach(selectedItems.stuffItems, id: \.self) { i in
                    HStack {
                        Text("\(i.emoji)\(i.name)")
                        Button("删除", role: .destructive) {
                            let index = selectedItems.stuffItems.firstIndex(of: i)
                            selectedItems.stuffItems.remove(at: index ?? 0)
                        }
                    }
                }
            }
            
            Spacer()
            Text("选择你想要的模式吧!")
            VStack {
                HStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Picker(selection: $selectedMode, label: Text("选择你想要的模式吧!")) {
                        ForEach(modeArray, id: \.self) { mode in
                            Text("\(mode)").tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button("重置", role: .destructive) {
                        isShowing = true
                    }
                    .alert(isPresented: $isShowing) {
                        Alert(
                            title: Text("确定要重置吗?"),
                            message: Text("重置后所选食材将会清空"),
                            primaryButton: Alert.Button.destructive(Text("重置")) {
                                resetRecipes()
                            },
                            secondaryButton: Alert.Button.cancel(Text("取消"))
                        )
                    }
                    
                    Spacer()
                    
                    Button("查看结果") {
                        availableRecipes.removeAll()
                        if selectedMode == "模糊匹配" {
                            getRecipesFuzzyMatching(selectedItems.stuffItems)
                        } else if selectedMode == "严格匹配" {
                            getRecipesExactMatching(reverseSelectedItems)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .shadow(radius: 3)
                    
                    Spacer()
                    
                    Button("清除", role: .destructive) {
                        showingWipeOutAlert = true
                    }
                    .alert(isPresented: $showingWipeOutAlert) {
                        Alert(
                            title: Text("确定要清除吗?"),
                            message: Text("清除后所有的菜谱将会清空"),
                            primaryButton: Alert.Button.destructive(Text("清除")) {
                                availableRecipes.removeAll()
                            },
                            secondaryButton: Alert.Button.cancel(Text("取消"))
                        )
                    }
                    
                    Spacer()
                    
                }

                ForEach(availableRecipes, id: \.self) { recipe in
                    NavigationLink(destination: VideoWebPage(url: URL(string: recipe.link)!)) {
                        Text("\(recipe.name)")
                    }
                }
            }
        }

    }
    
    func getRecipes(_ mode: String, _ items: [StuffItem]) {
        if mode == "模糊匹配" {
            for recipe in recipeData {
                for item in items {
                    if recipe.stuff.contains(item.name) && !availableRecipes.contains(recipe) {
                        availableRecipes.append(recipe)
                    }
                }
            }
        } else if mode == "严格匹配" {
            for recipe in recipeData {
                for item in items {
                    if !recipe.stuff.contains(item.name) && !availableRecipes.contains(recipe) {
                        availableRecipes.append(recipe)
                    } else {
                        continue
                    }
                }
            }
        }
    }
    
    func getRecipesFuzzyMatching(_ items: [StuffItem]) {
        for recipe in recipeData {
            for item in items {
                if recipe.stuff.contains(item.name) && !availableRecipes.contains(recipe) {
                    availableRecipes.append(recipe)
                }
            }
        }
    }
    
    func getRecipesExactMatching(_ items: [StuffItem]) {
        var flag = true
        for recipe in recipeData {
            for item in items {
                if availableRecipes.contains(recipe) {
                   continue
                }
                if recipe.stuff.contains(item.name) {
                    flag = false
                }
            }
            if flag {
                availableRecipes.append(recipe)
            }
            flag = true
        }
    }
    
    func resetRecipes() {
        availableRecipes.removeAll()
        selectedItems.stuffItems.removeAll()
    }

}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
    }
}
