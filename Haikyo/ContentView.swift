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
    @State private var isSharing = false
    
    func shareButton() {
        isSharing.toggle()
        
        let testURL = URL(string: "https://apple.com")
        let sharingActivity = UIActivityViewController(activityItems: [testURL!], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(sharingActivity, animated: true, completion: nil)
        
    }
    
    var body: some View {
        HaikuView()
        Button(action: shareButton){
            Image(systemName: "square.and.arrow.up")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
