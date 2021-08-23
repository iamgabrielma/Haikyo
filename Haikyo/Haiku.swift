//
//  Haiku.swift
//  Haikyo
//
//  Created by Gabriel Maldonado Almendra on 13/8/21.
//

import Foundation
import UIKit

class Haiku: ObservableObject {
    
    @Published var haiku: [String]
    @Published var haikuStyle: [UIColor]
    
    let haikuDB = HaikuDataBase()
    
    init() {
        self.haiku = haikuDB.haikus[0]
        self.haikuStyle = HaikuColors.haikuStyles[0]
    }
    
    func getRandomHaiku() {
        // Randomize which Haiku we'll select from the DB Object
        let number = Int.random(in: 0 ..< haikuDB.haikus.count)
        let userDefaults = UserDefaults(suiteName: "group.haikyodata")
        // Set the @Published object (for the app) and fill UserDefaults (for the widget) with the same value
        haiku = haikuDB.haikus[number]
        userDefaults?.setValue(haiku, forKey: "dailyHaiku")
    }
    
    func setRandomStyle(){
        // Randomize which color style we'll get
        let number = Int.random(in: 0 ..< HaikuColors.haikuStyles.count)
        haikuStyle = HaikuColors.haikuStyles[number]
    }
    

}
