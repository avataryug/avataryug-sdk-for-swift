//
//  ColorExtensions.swift
//  SDKClientSwift
//
//  Created by Developer1 on 18/07/23.
//

import Foundation
import SwiftUI

//extension Color {
//    func toHexString() -> String {
//        var r:CGFloat = 0
//        var g:CGFloat = 0
//        var b:CGFloat = 0
//        var a:CGFloat = 0
//
//        getRed(&r, green: &g, blue: &b, alpha: &a)
//
//        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
//
//        return NSString(format:"#%06x", rgb) as String
//    }
//
//    init(red: Int, green: Int, blue: Int) {
//        assert(red >= 0 && red <= 255, "Invalid red component")
//        assert(green >= 0 && green <= 255, "Invalid green component")
//        assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//    }
//
//}

func hexString(from color: Color) -> String {
    print(color)
    let red = Int(color.cgColor?.components?[0] ?? 0 * 255.0)
    let green = Int(color.cgColor?.components?[1] ?? 0 * 255.0)
    let blue = Int(color.cgColor?.components?[2] ?? 0 * 255.0)

    return String(format: "#%02X%02X%02X", red, green, blue)
}
