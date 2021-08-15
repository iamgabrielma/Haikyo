//
//  HaikuView.swift
//  Haikyo
//
//  Created by Gabriel Maldonado Almendra on 15/8/21.
//

import SwiftUI
import WidgetKit


struct HaikuView: View {
    
    @ObservedObject private var dailyHaiku = Haiku()
    
    var body: some View {
        
        GeometryReader{ container in
            VStack {
                HStack{
                    
                    Text("\(dailyHaiku.haiku[0])")
                        .frame(width: container.size.width * 0.33, height: container.size.height)
                        .background(Color(UIColor.systemGray2))
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.white))
                        .multilineTextAlignment(.center)
                    
                    Text("\(dailyHaiku.haiku[1])").frame(width: container.size.width * 0.33, height: container.size.height)
                        .background(Color(UIColor.systemGray6))
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.black))
                        .multilineTextAlignment(.center)
                    
                    Text("\(dailyHaiku.haiku[2])").frame(width: container.size.width * 0.33, height: container.size.height)
                        .background(Color(UIColor.systemGray2))
                        .font(.system(size: 20))
                        .foregroundColor(Color(UIColor.white))
                        .multilineTextAlignment(.center)
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

struct HaikuView_Previews: PreviewProvider {
    static var previews: some View {
        HaikuView()
    }
}
