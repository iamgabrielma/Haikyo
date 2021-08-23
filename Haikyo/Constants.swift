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
    static let haikuStyles: [[UIColor]] = [haikuBgCream, haikuBgGrey, haikuBgPurple]
    
    // Background Colors:
    static var haikuBgCream: [UIColor] = [
        UIColor(red: 0.98, green: 0.82, blue: 0.76, alpha: 1.00),
        UIColor(red: 0.28, green: 0.80, blue: 0.95, alpha: 1.00)
    ]
    static var haikuBgGrey: [UIColor] = [
        UIColor.systemGray2,
        UIColor.systemGray6
    ]
    static let haikuBgPurple: [UIColor] = [
        UIColor(red: 0.83, green: 0.77, blue: 0.98, alpha: 1.00),
        UIColor(red: 0.98, green: 0.82, blue: 0.76, alpha: 1.00)
    ]
    static let haikuBgPink: [UIColor] = []
    
    // Font Colors:
    static var haikuFont: [UIColor: UIColor] = [:]
    
    
}
