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
    
    var body: some View {
        
        GeometryReader{ container in
            VStack {
                HStack{
                    Text("\(dailyHaiku.haiku[0])").frame(width: container.size.width * 0.33)
                    Text("\(dailyHaiku.haiku[1])").frame(width: container.size.width * 0.33)
                    Text("\(dailyHaiku.haiku[2])").frame(width: container.size.width * 0.33)
                }
            }
            // Makes the whole screen tappable:
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .contentShape(Rectangle())
            .onTapGesture(perform: {
                // Sets a new Haiku for both the app and the widget:
                self.dailyHaiku.getRandomHaiku()
                //Reload widget-associated data:
                WidgetCenter.shared.reloadAllTimelines()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
