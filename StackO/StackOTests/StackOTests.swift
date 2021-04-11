//
//  StackOTests.swift
//  StackOTests
//
//  Created by Amanda Baret on 2021/04/10.
//

import XCTest
import Combine

@testable import StackO

class StackOTests: XCTestCase {

    var store: StackStore!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        self.store = StackStore()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetStacks_Success() {
        let validation = expectation(description: "FullFill")
        var success = false
        self.store.getStacks(searchText: "SwiftUI")
        self.store.stacksFetched
            .sink { (isSuccess) in
                success = isSuccess
                validation.fulfill()
            }
            .store(in: &cancellables)
        self.waitForExpectations(timeout: 10) { error in
            XCTAssertTrue(success)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
