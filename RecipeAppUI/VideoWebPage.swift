//
//  VideoWebPage.swift
//  食材食用手册
//
//  Created by Li Li on 2022/7/23.
//

import SwiftUI
import WebKit
 
struct VideoWebPage: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

