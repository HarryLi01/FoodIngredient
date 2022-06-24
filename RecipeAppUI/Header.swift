//
//  header.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/5/21.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            Image("CookingIcon")
                .resizable()
                .frame(width: 50, height: 50)
            Text("开始做饭吧!")
                .font(.body)
            Divider()
            Spacer()
            HStack {
                Text("🫕 选择你的食材吧！")
                    .font(.title2)
            }
            
        }
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
