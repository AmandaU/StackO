//
//  StackView.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import SwiftUI


struct StackView: View {
    @EnvironmentObject var stackStore: StackStore

    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                HeaderView()
                TitleView()
                WebView(text: .constant(self.stackStore.stack?.body ?? "No available content"))
                     .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .padding()
            }
            .padding(0)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

private struct TitleView: View {
    @EnvironmentObject var stackStore: StackStore
    var body: some View {
        HStack{
            Text(self.stackStore.stack?.title ?? "No available title")
                .font(.body)
                .bold()
                .foregroundColor(Color("LightGray"))
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .padding()
        }
        .padding(0)
        .background(Color(.systemGray5))
        .frame(minWidth: 0,  maxWidth: .infinity)

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
