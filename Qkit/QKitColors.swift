//
//  QKitPallette.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

class QKitColors {
    static var TEXT_LABEL_COLOR = { UIColor.white }()
    
    //MARK: - PRIMARY COLORS
    static var PRIMARY = UIColor(red: 1.00, green: 0.44, blue: 0.38, alpha: 1.00)
    
    //MARK: - SECONDARY COLORS
    static var SECONDARY_01 = UIColor(red: 1.0, green: 142.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
    static var SECONDARY_02 = UIColor(red: 1.0, green: 57.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0)
    static var SECONDARY_03 = UIColor(red: 150.0 / 255.0, green: 86.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
    static var SECONDARY_04 = UIColor(red: 244.0 / 255.0, green: 238.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
    
    //MARK: - GRAYSCALE
    static var GRAYSCALE_01 = UIColor(red: 39.0 / 255.0, green: 17.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0)
    static var GRAYSCALE_02 = UIColor(red: 58.0 / 255.0, green: 55.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
    static var GRAYSCALE_03 = UIColor(red: 123.0 / 255.0, green: 113.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
    static var GRAYSCALE_04 = UIColor(red: 244.0 / 255.0, green: 242.0 / 255.0, blue: 242.0 / 255.0, alpha: 1.0)
    
    //MARK: - HIGHLIGHT COLORS:
    static var HIGHLIGHT_GREEN_01 = UIColor(red: 108.0 / 255.0, green: 161.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0)
    
    static var HIGHLIGHT_ORANGE_02 = UIColor(red: 1.0, green: 173.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0)
    
    static var DARKISH_PINK = UIColor(red: 229.0 / 255.0, green: 49.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
    static var ORANGE = UIColor(red: 1.00, green: 0.40, blue: 0.23, alpha: 1.00)
    
    

    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x0000_00FF) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

