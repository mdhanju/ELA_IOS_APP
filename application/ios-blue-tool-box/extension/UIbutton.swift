//
//  UIbutton.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 01/03/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func blink() {
        self.alpha = 0.0;
        UIView.animate(withDuration: 0.6, //Time duration you want,
                       delay: 0.0,
                       options: [.curveEaseInOut, .autoreverse, .repeat],
                       animations: { [weak self] in self?.alpha = 1.0 },
                       completion: { [weak self] _ in self?.alpha = 0.0 })
    }
    
    func stopBlink() {
        self.layer.removeAllAnimations()
        self.alpha = 1.0;
        self.isHidden = false
        // [self.layer removeAllAnimations];
    }
}
