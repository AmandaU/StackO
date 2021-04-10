//
//  DeviceExtensions.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import UIKit

extension UIDevice {
    var bottomNotch: CGFloat {
        let notch = UIApplication.shared.windows.first { $0.isKeyWindow }?.safeAreaInsets.bottom ?? 0
        return  notch == 0 ? 5 : notch
    }

    var topNotch: CGFloat {
        let notch = UIApplication.shared.windows.first { $0.isKeyWindow }?.safeAreaInsets.top ?? 0
        return  notch == 0 ? 5 : notch
    }
}
