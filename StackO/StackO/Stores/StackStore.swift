//
//  StackStore.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import Combine
import SwiftUI

class StackStore: ObservableObject {
    @Published var stacks = [Stack]()
    @Published var stack: Stack?
  
    var cancellationToken: AnyCancellable?
    var stacksFetched = PassthroughSubject<Void, Never>()

    func getContacts() {
        cancellationToken = StackApi.getStacks()
            .sink(receiveCompletion: { _ in
            },
            receiveValue: {
                self.stacks = $0
                self.stacksFetched.send()
            })
    }
}
