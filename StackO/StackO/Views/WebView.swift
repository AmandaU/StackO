//
//  WebView.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  @Binding var text: String

  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(text, baseURL: nil)
  }
}
