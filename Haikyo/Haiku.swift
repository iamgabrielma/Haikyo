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
        let number = Int.random(in: 0..<3)
        haiku = haikuDB.haikus[number]
    }
    
    init() {
        self.haiku = haikuDB.haikus[0]
    }
    

}
