//
//  StackOApp.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import SwiftUI

@main
struct StackOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NavigationStore())
                .environmentObject(StackStore())
        }
    }
}
