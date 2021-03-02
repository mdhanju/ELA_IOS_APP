//
//  UIview.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 01/03/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func blink(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, alpha: CGFloat = 0.0) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            self.alpha = alpha
        })
    }
}
