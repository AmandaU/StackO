//
//  SearchBarComponent.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import SwiftUI

struct SearchBarComponent: View {
    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
        HStack {

            TextField("Search ...", text: $text.onChange({ (text) in
                isEditing = !text.isEmpty
            }))
                .padding()
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .foregroundColor(.black)
                .accentColor(Color.gray)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing && !self.text.isEmpty {
                            Button(action: {
                                    if !self.text.isEmpty {
                                        self.text = String(self.text.prefix(self.text.count - 1))
                                    }
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            })
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing && !self.text.isEmpty {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .padding(.vertical, 12)
    }
}

struct SearchBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarComponent(text: .constant(""))
    }
}
