//
//  VideoPage.swift
//  食材食用手册
//
//  Created by Li Li on 2022/7/21.
//

import SwiftUI
import AVKit

struct VideoPage: View {
    let url: String
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .frame(width: 380, height: 200)
            .padding()
    }
}

struct VideoPage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPage(url: "https://www.bilibili.com/video/BV1Bv411C7X3")
    }
}
