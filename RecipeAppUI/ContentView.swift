//
//  ContentView.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @EnvironmentObject var selectedItems: StuffItemArray
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Header()
                    Vegetable()
                    Meat()
                    MainFood()
                    Result()
                }
            }
            .navigationTitle("食材食用手册")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(id: "info") {
                    Button(action: {showSheet = true }) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showSheet) {
                        InfoSheet()
                    }
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @ObservedObject var selectedItems: StuffItemArray = .shared
    static var previews: some View {
        ContentView()
    }
}
