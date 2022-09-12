//
//  activityStatus.swift
//  HoldMyHand
//
//  Created by loka mloka on 24/09/1443 AH.
//

import Foundation
import Firebase
import SwiftUI


class activityStatus {
//     var activity1Status = "unknown"
     var complete = "1"
     var uncomplete = "0"
    
    static let Status = activityStatus()

//get Activity Status of level one from database
//func getLevel_1()->String{
//    let userID = Auth.auth().currentUser?.uid
//    let ref = Database.database().reference()
//    ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_1").getData(completion:  { error, snapshot in
//        guard error == nil else {
//            print(error!.localizedDescription)
//            return;
//        }
//        self.activity1Status = snapshot.value as? String ?? ""
//
//    });
//    return activity1Status
//}

//set Activity Status of level one to database
func setLevel_1(){
    let userID = Auth.auth().currentUser?.uid
//store user state to database
let ref = Database.database().reference()
ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_1":complete])
}
    
    //get level 2
//    func getLevel_2()->String{
//        let userID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference()
//
//        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_2").getData(completion:  { error, snapshot in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return;
//            }
//            self.activity1Status = snapshot.value as? String ?? ""
//
//        });
//        return activity1Status
//    }

    //set level 2
    func setLevel_2(){
        let userID = Auth.auth().currentUser?.uid
    //store user state to database
    let ref = Database.database().reference()
    ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_2":complete])
    }
    
//    //get level 3
//    func getLevel_3()->String{
//        let userID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference()
//
//        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_3").getData(completion:  { error, snapshot in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return;
//            }
//            self.activity1Status = snapshot.value as? String ?? ""
//
//        });
//        return activity1Status
//    }

    //set level 3
    func setLevel_3(){
        let userID = Auth.auth().currentUser?.uid
    //store user state to database
    let ref = Database.database().reference()
    ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_3":complete])
    }
    
//    //get level 4
//    func getLevel_4()->String{
//        let userID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference()
//
//        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_4").getData(completion:  { error, snapshot in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return;
//            }
//            self.activity1Status = snapshot.value as? String ?? ""
//
//        });
//        return activity1Status
//    }

    //set level 4
    func setLevel_4(){
        let userID = Auth.auth().currentUser?.uid
    //store user state to database
    let ref = Database.database().reference()
    ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_4":complete])
    }
    
    //get level 5
//    func getLevel_5()->String{
//        let userID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference()
//
//        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_5").getData(completion:  { error, snapshot in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return;
//            }
//            self.activity1Status = snapshot.value as? String ?? ""
//
//        });
//        return activity1Status
//    }

    //set level 5
    func setLevel_5(){
        let userID = Auth.auth().currentUser?.uid
    //store user state to database
    let ref = Database.database().reference()
    ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_5":complete])
    }
    
    //reset
    func resetLevels(){
        let userID = Auth.auth().currentUser?.uid
    //store user states to database
    let ref = Database.database().reference()
        ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_1":uncomplete])
        ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_2":uncomplete])
        ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_3":uncomplete])
        ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_4":uncomplete])
        ref.child("EmotionalFaceActivity").child("Status").child(userID ?? " ").updateChildValues(["Level_5":uncomplete])
    }

}
