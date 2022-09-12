//
//  HoldMyHandApp.swift
//  HoldMyHand
//
//  Created by loka mloka on 20/07/1443 AH.
//

import SwiftUI
import Firebase

@main
struct HoldMyHandApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var env = Environment1()
    init(){
        FirebaseApp.configure()
    }
    @StateObject private var userS = userSetting()
    var body: some Scene {
        WindowGroup {
            ZStack {
            ContentView()
                .environmentObject(userS)
                .environmentObject(env)
            }
//            ZStack {
//               // BoyViews()
//                GirlViews()
//            }
        }
    }
}
