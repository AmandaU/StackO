//
//  ViewExtensions.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import SwiftUI

struct Show: ViewModifier {
    @Binding var isVisible: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            content
        } else {
            content.hidden()
        }
    }
}

extension View {
    func show(isVisible: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: Show(isVisible: isVisible))
    }
}
