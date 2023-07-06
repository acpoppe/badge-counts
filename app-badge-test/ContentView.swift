//
//  ContentView.swift
//  app-badge-test
//
//  Created by Allison Poppe - Work on 06.07.23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var badgeCount = "0"
    
    var body: some View {
        VStack {
            Text("Badge Count:")
            TextField(text: $badgeCount, label: {
                Text("Badge Count:")
            })
            .padding()
            .border(.black)
            .keyboardType(.decimalPad)
            .onChange(of: badgeCount) { count in
                guard let intCount = Int(count) else {
                    badgeCount = "0"
                    UserDefaults.standard.setValue(0, forKey: "badgeCount")
                    return
                }
                UserDefaults.standard.setValue(intCount, forKey: "badgeCount")
                UIApplication.shared.applicationIconBadgeNumber = Int(self.badgeCount)!
//                self.sendNotification()
                }
            }
        .onAppear {
            self.badgeCount = UserDefaults.standard.string(forKey: "badgeCount") ?? "0"
            UIApplication.shared.applicationIconBadgeNumber = Int(self.badgeCount)!
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
