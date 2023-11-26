//
//  Themes.swift
//  Focust
//
//  Created by Ng Qi An on 19/11/23.
//

import Foundation
import SwiftUI

enum AppearanceMode: String, Codable, CaseIterable {
    case Light
    case Dark
}

enum AppearanceScheme: String, Codable, CaseIterable {
    case Blue
    case Teal
    case Yellow
    case Orange
    case Red
    case Purple
}

func RGBtoColor(_ red: Int = 255, _ green: Int = 255, _ blue: Int = 255) -> Color {
    return Color(red: Double(red) / 255, green: Double(green) / 255, blue: Double(blue) / 255)
}

struct Scheme {
    var foreground:Color = RGBtoColor(0, 0, 0)
    var background:Color = RGBtoColor(0, 0, 0)
    var button:Color = RGBtoColor(0, 0, 0)
    var surface1:Color = RGBtoColor(0, 0, 0)
    var surface2:Color = RGBtoColor(0, 0, 0)
    var surface3:Color = RGBtoColor(0, 0, 0)
    var surface4:Color = RGBtoColor(0, 0, 0)
    var shadow:Color = RGBtoColor(0, 0, 0)
}
struct ColorMode {
    var blue:Scheme = Scheme()
    var teal: Scheme = Scheme()
    var yellow: Scheme = Scheme()
    var orange: Scheme = Scheme()
    var red: Scheme = Scheme()
    var purple: Scheme = Scheme()
    var gray: Scheme = Scheme()

}

struct colorScheme {
    static let light = ColorMode(
        blue: Scheme(foreground: RGBtoColor(14, 165, 233),
                    background: RGBtoColor(14, 165, 233),
                    button: RGBtoColor(56, 189, 248)
                    ),
        teal: Scheme(foreground: RGBtoColor(20, 184, 165),
                     background: RGBtoColor(20, 184, 165),
                     button: RGBtoColor(45, 212, 191)
                    ),
        yellow: Scheme(foreground: RGBtoColor(202, 139, 4),
                      background: RGBtoColor(202, 139, 4),
                      button: RGBtoColor(234, 178, 8)
                      ),
        orange: Scheme(foreground: RGBtoColor(234, 90, 12),
                       background: RGBtoColor(234, 90, 12),
                       button: RGBtoColor(249, 117, 22)
                      ),
        red: Scheme(foreground: RGBtoColor(220, 38, 38),
                    background: RGBtoColor(220, 38, 38),
                    button: RGBtoColor(239, 68, 68)
                   ),
        purple: Scheme(foreground: RGBtoColor(146, 51, 234),
                       background: RGBtoColor(146, 51, 234),
                       button: RGBtoColor(168, 85, 247)
                    ),
        gray: Scheme(foreground: RGBtoColor(0, 0, 0),
                     background: RGBtoColor(255, 255, 255),
                     surface1: RGBtoColor(243, 244, 246),
                     surface2: RGBtoColor(228, 228, 231),
                     surface3: RGBtoColor(212, 212, 216),
                     surface4: RGBtoColor(161, 161, 170),
                     shadow: RGBtoColor(161, 161, 170)
                     )
        
    )
    static let dark = ColorMode(
        blue: Scheme(foreground: RGBtoColor(14, 165, 233),
                    background: RGBtoColor(12, 74, 110),
                    button: RGBtoColor(3, 106, 161)
                    ),
        teal: Scheme(foreground: RGBtoColor(20, 184, 165),
                     background: RGBtoColor(19, 78, 74),
                     button: RGBtoColor(17, 94, 89)
                    ),
        yellow: Scheme(foreground: RGBtoColor(202, 139, 4),
                      background: RGBtoColor(113, 62, 18),
                      button: RGBtoColor(133, 77, 14)
                      ),
        orange: Scheme(foreground: RGBtoColor(234, 90, 12),
                       background: RGBtoColor(124, 45, 18),
                       button: RGBtoColor(154, 52, 18)
                      ),
        red: Scheme(foreground: RGBtoColor(220, 38, 38),
                    background: RGBtoColor(127, 29, 29),
                    button: RGBtoColor(153, 27, 27)
                   ),
        purple: Scheme(foreground: RGBtoColor(146, 51, 234),
                       background: RGBtoColor(89, 28, 135),
                       button: RGBtoColor(107, 33, 168)
                    ),
        gray: Scheme(foreground: RGBtoColor(255, 255, 255),
                     background: RGBtoColor(0, 0, 0),
                     surface1: RGBtoColor(24, 24, 27),
                     surface2: RGBtoColor(39, 39, 42),
                     surface3: RGBtoColor(63, 63, 70),
                     surface4: RGBtoColor(82, 82, 91)
                    )
    )
}


struct Theme {
    
    var mode: AppearanceMode = AppearanceMode.Light
    var scheme: AppearanceScheme = AppearanceScheme.Teal
    
    func determineMode() -> ColorMode{
        var colorSchemeMode: ColorMode
        if self.mode == AppearanceMode.Light {
            colorSchemeMode = colorScheme.light
        } else {
            colorSchemeMode = colorScheme.dark
        }
        return colorSchemeMode
    }
    
    var color: Scheme {
        let colorSchemeMode = determineMode()
        switch self.scheme {
        case AppearanceScheme.Blue:
            return colorSchemeMode.blue
        case AppearanceScheme.Teal:
            return colorSchemeMode.teal
        case AppearanceScheme.Yellow:
            return colorSchemeMode.yellow
        case AppearanceScheme.Orange:
            return colorSchemeMode.orange
        case AppearanceScheme.Red:
            return colorSchemeMode.red
        case AppearanceScheme.Purple:
            return colorSchemeMode.purple
        }
    }
    var blue: Scheme {
        let colorSchemeMode = determineMode()
        return colorSchemeMode.blue
    }
    var teal: Scheme {
        let colorSchemeMode = determineMode()
        return colorSchemeMode.teal
    }
    var yellow: Scheme {
        let colorSchemeMode = determineMode()
        return colorSchemeMode.yellow
    }
    var orange: Scheme {
        let colorSchemeMode = determineMode()
        return colorSchemeMode.orange
    }
    var red: Scheme {
        let colorSchemeMode = determineMode()
        return colorSchemeMode.red
    }
    var purple: Scheme {
        let colorSchemeMode = determineMode()
        return colorSchemeMode.purple
    }
    var gray: Scheme {
        let colorSchemeMode = determineMode()
        return colorSchemeMode.gray
    }
}
