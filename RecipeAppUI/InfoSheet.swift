//
//  InfoSheet.swift
//  RecipeAppUI
//
//  Created by Li Li on 2022/6/1.
//

import SwiftUI

struct InfoSheet: View {
    var body: some View {
        List {
            Section(header: Text("模糊匹配")) {
                Text("检索出的菜谱的所需材料将含有你所选的食材。")
            }
            Section(header: Text("严格匹配")) {
                Text("检索出的菜谱的所需材料将不会含有你没有选中的食材。")
            }
            Section(header: Text("重置")) {
                Text("清空所有选中的食材。")
            }
            Section(header: Text("清除")) {
                Text("将检索出的菜谱清空。")
            }
        }
    }
}

struct InfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        InfoSheet()
    }
}
