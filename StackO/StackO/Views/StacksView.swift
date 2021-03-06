//
//  StacksView.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import SwiftUI

struct StacksView: View {
    @EnvironmentObject var stackStore: StackStore
    @EnvironmentObject var navigationStore: NavigationStore

    var body: some View {
        ZStack{
            BackgroundComponent()
            VStack(spacing: 0) {
                HeaderView()
                ZStack {
                    VStack {
                        Spacer()
                        Text("Stack Overflow Search")
                            .font(.body)
                            .bold()
                            .frame(alignment: .center)
                            .foregroundColor(Color("LightGray"))
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    .show(isVisible: .constant(self.stackStore.stacks.count == 0 && !self.stackStore.isLoading))
                    VStack {
                        ShimmerView().frame(minWidth: 0,  maxWidth: .infinity, minHeight: 60, maxHeight: 60).padding(.top)
                        ShimmerView().frame(minWidth: 0,  maxWidth: .infinity, minHeight: 60, maxHeight: 60).padding(.top)
                        ShimmerView().frame(minWidth: 0,  maxWidth: .infinity, minHeight: 60, maxHeight: 60).padding(.top)
                        Spacer()
                    }
                    .show(isVisible: .constant(self.stackStore.isLoading && self.stackStore.stacks.count == 0))
                    ScrollView() {

                        ForEach(self.stackStore.stacks, id: \.owner.user_id) { item in

                            HStack(spacing: 5) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("StackBlue"))
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .padding(.leading, 5)
                                    .show(isVisible: .constant(item.is_answered ?? false))
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.title ?? "No available title")
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                        .frame(alignment: .leading)
                                        .foregroundColor(Color("StackBlue"))
                                        .fixedSize(horizontal: false, vertical: true)
                                    Text("asked by \(item.owner.display_name ?? "no available name")")
                                        .font(.system(size: 10, weight: .regular, design: .default))
                                        .foregroundColor(Color("LightGray"))
                                        .frame(alignment: .leading)
                                }
                                .padding(.vertical, 5)
                                .frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading)
                                VStack(alignment: .trailing, spacing: 1) {
                                    Text("\(item.score ?? 0) votes")
                                        .font(.system(size: 10, weight: .regular, design: .default))
                                        .foregroundColor(Color("LightGray"))
                                        .frame(alignment: .trailing)
                                    Text("\(item.answer_count ?? 0) answers")
                                        .font(.system(size: 10, weight: .regular, design: .default))
                                        .foregroundColor(Color("LightGray"))
                                        .frame(alignment: .trailing)
                                    Text("\(item.view_count ?? 0) views")
                                        .font(.system(size: 10, weight: .regular, design: .default))
                                        .foregroundColor(Color("LightGray"))
                                        .frame(alignment: .trailing)
                                }
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("LightGray"))
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .padding(.trailing, 5)
                            }
                            .background(Color.white)
                            .onTapGesture {
                                self.stackStore.stack = item
                                self.navigationStore.navigate(screen: .stack)
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 5)
                            .frame(minWidth: 0,  maxWidth: .infinity)

                        }
                    }
                    .background(Color(.systemGray6))
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

private struct HeaderView: View {

    @EnvironmentObject var stackStore: StackStore

    @State var searchText = ""

    var body: some View {
        HStack {
            SearchBarComponent(text: self.$searchText.onChange({ (search) in
                if search.count > 2 {
                    self.stackStore.getStacks(searchText: search)
                }
            }))
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .padding(.top, UIDevice.current.topNotch)
        .padding(.bottom,7)
        .background(Color("StackBlue"))
        .foregroundColor(.white)
    }
}


