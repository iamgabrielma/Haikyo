//
//  Haiku.swift
//  Haikyo
//
//  Created by Gabriel Maldonado Almendra on 13/8/21.
//

import Foundation

class Haiku: ObservableObject {
    
    @Published var haiku: [String]
    
    let haikuDB = HaikuDataBase()

    func getRandomHaiku() {
        let number = Int.random(in: 0 ..< haikuDB.haikus.count)
        haiku = haikuDB.haikus[number]
    }
    
    init() {
        self.haiku = haikuDB.haikus[0]
        // Init values so it doesn't crash...still broken :_D
        //UserDefaults.standard.setValue(self.haiku, forKey: "dailyHaiku")
    }
    

}
