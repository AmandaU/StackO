//
//  StackView.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import SwiftUI


struct StackView: View {
    var body: some View {
        ZStack{
            BackgroundComponent()
            VStack(spacing: 0) {
                HeaderView()
            }
        }
    }
}


private struct HeaderView: View {
    @EnvironmentObject var navigationStore: NavigationStore

    private func onClick() {
        self.navigationStore.back()
    }
    var body: some View {

        ZStack {
            HStack(alignment: .top, spacing: 0) {
                Text("Question")
                    .font(.body)
                    .foregroundColor(.white)

                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            HStack(alignment: .top, spacing: 0) {
                Button(action: self.onClick) {
                    HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(.trailing, 5)
                        Text("Back")
                            .font(.body)
                            .foregroundColor(.white)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                Spacer()
            }
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .padding(.top, UIDevice.current.topNotch)
        .padding(.bottom,7)
        .background( Color("StackBlue"))
    }
}
