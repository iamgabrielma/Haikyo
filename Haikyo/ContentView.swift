//
//  ContentView.swift
//  Haikyo
//
//  Created by Gabriel Maldonado Almendra on 13/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var dailyHaiku = Haiku()
    
    var body: some View {
        
        VStack {
            HStack{
                Text("\(dailyHaiku.haiku[0])")
                Text("\(dailyHaiku.haiku[1])")
                Text("\(dailyHaiku.haiku[2])")
            }
            Button("TAP", action: { self.dailyHaiku.getRandomHaiku() })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
