//
//  BackgroundComponent.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation

import Foundation
import SwiftUI

struct BackgroundComponent: View {
    var body: some View {
        Rectangle()
            .fill(Color(.systemGray6))
            .edgesIgnoringSafeArea(.all)
    }
}
