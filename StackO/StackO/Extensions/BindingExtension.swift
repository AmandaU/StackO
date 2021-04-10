//
//  BindingExtension.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import  SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
