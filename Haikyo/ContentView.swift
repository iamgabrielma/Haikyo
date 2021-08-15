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
        HaikuView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
