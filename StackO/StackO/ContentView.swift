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
            ViewComponent(screen: .main, view: AnyView(MainView()))
            ViewComponent(screen: .stacks, view: AnyView(StacksView()))
            ViewComponent(screen: .stack, view: AnyView(StackView()))
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
