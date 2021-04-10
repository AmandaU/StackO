//
//  ContentView.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationStore:  NavigationStore

    var body: some View {

        ZStack{
            ViewComponent(screen: .main, view: AnyView(StacksView()))
            ViewComponent(screen: .contacts, view: AnyView(StackView()))
        }
        .onAppear {
            self.navigationStore.navigate(screen: .main)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private struct ViewComponent: View {
    @EnvironmentObject var navigationStore:  NavigationStore

    var screen:  NavigationStore.Screen
    var view: AnyView

    var body: some View {
        self.screen == self.navigationStore.screen
            ? self.view
            : AnyView(EmptyView())
    }
}
