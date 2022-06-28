//
//  Font+Ext.swift
//  GamePlay
//
//  Created by Didik on 28/06/22.
//

import SwiftUI

extension Font {
    static func latoLight(fontSize: CGFloat) -> Font {
        return .custom("Lato-Light", size: fontSize)
    }
    
    static func latoRegular(fontSize: CGFloat) -> Font {
        return .custom("Lato-Regular", size: fontSize)
    }
    
    static func latoBold(fontSize: CGFloat) -> Font {
        return .custom("Lato-Bold", size: fontSize)
    }
    
    static func latoItalic(fontSize: CGFloat) -> Font {
        return .custom("Lato-Italic", size: fontSize)
    }
}
