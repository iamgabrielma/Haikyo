//
//  Constants.swift
//  Haikyo
//
//  Created by Gabriel Maldonado Almendra on 23/8/21.
//

import Foundation
import UIKit

enum HaikuColors {
    
    // Array of all Combinations:
    static let haikuStyles: [[UIColor]] = [haikuBgCream, haikuBgGrey, haikuBgPurple, haikuBgLime, haikuBgGreen, haikuBgPink]
    
    // Background Colors:
    static let haikuBgCream: [UIColor] = [
        UIColor(red: 0.98, green: 0.82, blue: 0.76, alpha: 1.00),
        UIColor(red: 0.28, green: 0.80, blue: 0.95, alpha: 1.00)
    ]
    static let haikuBgGrey: [UIColor] = [
        UIColor.systemGray2,
        UIColor.systemGray6
    ]
    static let haikuBgPurple: [UIColor] = [
        UIColor(red: 0.83, green: 0.77, blue: 0.98, alpha: 1.00),
        UIColor(red: 0.98, green: 0.82, blue: 0.76, alpha: 1.00)
    ]
    static let haikuBgLime: [UIColor] = [
        UIColor(red: 217/255, green: 237/255, blue: 146/255, alpha: 1.00),
        UIColor(red: 153/255, green: 217/255, blue: 140/255, alpha: 1.00)
    ]
    static let haikuBgGreen: [UIColor] = [
        UIColor(red: 118/255, green: 200/255, blue: 147/255, alpha: 1.00),
        UIColor(red: 52/255, green: 160/255, blue: 164/255, alpha: 1.00)
    ]
    static let haikuBgPink: [UIColor] = [
        UIColor(red: 255/255, green: 198/255, blue: 255/255, alpha: 1.00),
        UIColor(red: 189/255, green: 178/255, blue: 255/255, alpha: 1.00),
    ]
    
    // Font Colors:
    static let haikuFont: [UIColor: UIColor] = [:]
}
