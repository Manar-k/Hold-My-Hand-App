//
//  userSetting.swift
//  HoldMyHand
//
//  Created by loka mloka on 16/08/1443 AH.
//

import Foundation

class userSetting: ObservableObject{
    
    @Published var isLoggedIn : Bool {
        didSet{
            UserDefaults.standard.set(isLoggedIn, forKey: "login")
        }
    }
    init(){
        self.isLoggedIn = false 
    }
}
