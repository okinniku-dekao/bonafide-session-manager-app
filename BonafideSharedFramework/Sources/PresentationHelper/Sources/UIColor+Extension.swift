//
//  UIColor+Extension.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/24.
//

import UIKit

public extension UIColor {
    static func fromARGB(_ colorCode: Int) -> UIColor {
        let red = CGFloat((colorCode & 0xFF000000) >> 24) / 255.0
        let green = CGFloat((colorCode & 0x00FF0000) >> 16) / 255.0
        let blue = CGFloat((colorCode & 0x0000FF00) >> 8) / 255.0
        let alpha = CGFloat(colorCode & 0x000000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
