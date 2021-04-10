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

    func getStacks(searchText: String) {
        cancellationToken = StackApi.getStacks(searchText: searchText)
            .sink(
                receiveCompletion: ({ (completion) in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("\(error)")
                    }
                }),
            receiveValue: {
                if !$0.items.isEmpty {
                    self.stacks = $0.items 
                }
                self.stacksFetched.send()
            })
    }
}
