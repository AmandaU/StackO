//
//  MainView.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import SwiftUI

struct MainView: View {
    @EnvironmentObject var navigationStore: NavigationStore
    @State var animate = false

    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            BackgroundComponent()
            VStack(alignment: .center) {
                Spacer()
                ZStack {
                    Logo(size: 50).scaleEffect(self.animate ? 1 : 0)
                    Logo(size: 60).scaleEffect(self.animate ? 1 : 0)
                    Logo(size: 70).scaleEffect(self.animate ? 1 : 0)
                    Logo(size: 80).scaleEffect(self.animate ? 1 : 0)
                    Logo(size: 90).scaleEffect(self.animate ? 1 : 0)
                        .onTapGesture {
                            self.navigationStore.navigate(screen: .stacks)
                        }
                }
                .onReceive(timer) { input in
                    if input > currentDate.addingTimeInterval(6) {
                        self.navigationStore.navigate(screen: .stacks)
                    }
                }
                .onAppear { self.animate.toggle() }
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                Spacer()
            }
        }
        .environmentObject(NavigationStore())
        .environmentObject(StackStore())
    }
}

private struct Logo: View {
    @State var size: CGFloat
    var body: some View {
        Image("logo")
            .frame(width: size, height: size, alignment: .center)
            .padding(.horizontal)
    }
}

