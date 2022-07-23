//
//  VideoPage.swift
//  食材食用手册
//
//  Created by Li Li on 2022/7/21.
//

import SwiftUI
import AVKit
import WebKit


//struct VideoPage: UIViewRepresentable {
//    var url: String
//    
//    func makeUIView(context: UIViewRepresentableContext<ContentView>) -> WKWebView { //实现协议里的makeUIView方法，用来初始化并返回一个WKWebView网页视图对象
//            return WKWebView()
//        }
//
//    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<ContentView>) { //实现协议里的updateUIView方法，用来设置网页视图需要加载的网址参数
//        let request = URLRequest(url:URL(string: "https://apple.com")!) //初始化一个URLRequest对象，作为网页视图的网址
//        uiView.load(request) //通过load方法，使网页视图加载该网址对应的网页
//    }
//    
////    var body: some View {
//////        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
//////            .frame(width: 380, height: 200)
//////            .padding()
////    }
//}
//
//struct VideoPage_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoPage(url: "https://www.bilibili.com/video/BV1Bv411C7X3")
//    }
//}
