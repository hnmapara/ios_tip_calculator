//
//  Constant.swift
//  TipCalculator
//
//  Created by Harshit Mapara on 9/30/16.
//  Copyright © 2016 Harshit Mapara. All rights reserved.
//

import Foundation
struct KEY_CONSTANT {
    static let default_tip = "key_default_tip"
}

class Utility {
    static func getDefaultTip() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: KEY_CONSTANT.default_tip)
    }
}
