//
//  ViewComponent.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import SwiftUI

struct ViewComponent: View {
    @EnvironmentObject var navigationStore:  NavigationStore

    var screen:  NavigationStore.Screen
    var view: AnyView

    var body: some View {
        self.screen == self.navigationStore.screen
            ? self.view
            : AnyView(EmptyView())
    }
}
