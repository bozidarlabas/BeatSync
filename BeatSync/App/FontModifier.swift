//
//  FontModifier.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import SwiftUI

enum LatoFontType: String {
    case regular = "Lato-Regular"
    case semibold = "Lato-Semibold"
    case bold = "Lato-Bold"
    case black = "Lato-Black"
}

struct FontModifier: ViewModifier {
    
    var type: LatoFontType, size: CGFloat
    
    init(_ type: LatoFontType = .regular, size: CGFloat = 16) {
        self.type = type
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content.font(Font.custom(type.rawValue, size: size))
    }
}
