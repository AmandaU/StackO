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
                AuthorView()
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
                .font(.system(size: 17, weight: .semibold, design: .default))
                .foregroundColor(Color("DarkGray"))
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .padding()
        }
        .frame(minWidth: 0,  maxWidth: .infinity)
        .padding(0)
        .background(Color(.systemGray5))
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

private struct AuthorView: View {
    @EnvironmentObject var navigationStore: NavigationStore
    @EnvironmentObject var stackStore: StackStore

    var tags: String {
        return self.stackStore.stack?.tags.map { String($0) }.joined(separator: ", ") ?? ""
    }

    var askedDate: String {
        let epocTime = TimeInterval(self.stackStore.stack?.creation_date ?? 0)
        let myDate =  Date(timeIntervalSince1970: epocTime)
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return "asked \(formatter.string(from: myDate))"
    }


    var body: some View {

        VStack {
            Divider()
            Text(self.tags)
                .font(.system(size: 10, weight: .bold, design: .default))
                .foregroundColor(Color("DarkGray"))
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: false)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .frame(height: 20, alignment: .leading)
                .padding(.horizontal)
            Divider()
            HStack(spacing: 0) {
                ImageView(withURL: self.stackStore.stack?.owner.profile_image ?? "", width: .constant(40), height: .constant(40))
                    .padding(.leading)
                    .frame(alignment: .leading)
                VStack(alignment: .leading, spacing: 0) {
                    Text(self.stackStore.stack?.owner.display_name ?? "No name available")
                        .font(.system(size: 10, weight: .regular, design: .default))
                        .foregroundColor(Color("DarkGray"))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("\(self.stackStore.stack?.owner.reputation ?? 0)")
                        .font(.system(size: 10, weight: .bold, design: .default))
                        .foregroundColor(Color("DarkGray"))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(self.askedDate)
                        .font(.system(size: 10, weight: .regular, design: .default))
                        .foregroundColor(Color("DarkGray"))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .frame(alignment: .leading)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(.bottom, UIDevice.current.bottomNotch)
            .background(Color(.systemGray5))
            .padding(.top, -8)

        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(0)
    }
}

