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

    var body: some View {
        ZStack {
            BackgroundComponent()
            VStack(alignment: .center) {
                    Spacer()
                    Image("logo")
                        .frame(width: 200, height: 200, alignment: .center)
                     .padding(.horizontal)
                        .cornerRadius(100)
                        .onTapGesture {
                            self.navigationStore.navigate(screen: .stacks)
                        }
                    Spacer()
                }

        }
    }
}

