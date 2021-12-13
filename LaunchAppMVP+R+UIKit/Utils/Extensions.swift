//
//  Extensions.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//

import Foundation

extension Int {
    var numberToString: String {
        return String(self)
    }
}

extension String {
    var stringToNumber: Int? {
        return Int(self)
    }
}
