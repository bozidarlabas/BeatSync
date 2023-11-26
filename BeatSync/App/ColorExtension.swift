//
//  ColorExtension.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import SwiftUI

extension Color {
    
    static let primaryColor = Color(hex: "111111")
    static let textPrimary = Color(hex: "ffffff")
    static let textPrimaryF1 = Color.textPrimary.opacity(0.8)
    static let whiteOpacity = Color(hex: "ffffff").opacity(0.2)
    
    init(hex: String, alpha: Double = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        let scanner = Scanner(string: cString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue:  Double(b) / 0xff, opacity: alpha)
    }
}
