//
//  ContentView.swift
//  Haikyo
//
//  Created by Gabriel Maldonado Almendra on 13/8/21.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @ObservedObject private var dailyHaiku = Haiku()
    //@State private var currentDailyHaiku = [] // I'll store here the UD to pass to the widgets.
    //@State private var currentDailyHaiku = UserDefaults.standard.stringArray(forKey: "dailyHaiku")
    
    var body: some View {
        
        VStack {
            HStack{
                Text("\(dailyHaiku.haiku[0])")
                Text("\(dailyHaiku.haiku[1])")
                Text("\(dailyHaiku.haiku[2])")
            }
        }
        // Makes the whole screen tappable:
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .contentShape(Rectangle())
        .onTapGesture(perform: {
            self.dailyHaiku.getRandomHaiku() // <- Goes into UD
            let userDefaults = UserDefaults(suiteName: "group.haikyodata")
            // Crash happens when I pass dailyHaiku as param
            //userDefaults?.setValue(dailyHaiku, forKey: "dailyHaiku")
            userDefaults?.setValue("test text from onTapGesture()", forKey: "dailyHaiku")
            WidgetCenter.shared.reloadAllTimelines() // <-- reload widget data associated

        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
