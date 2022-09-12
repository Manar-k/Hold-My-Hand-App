//
//  BoyViews.swift
//  face
//
//  Created by Smart Tracks on 16/04/2022.
//

//class Environment1 : ObservableObject {
//    @Published var num : Int = 1
//}

import SwiftUI
import Foundation
import Firebase

class Environment1 : ObservableObject {
    @Published var num : Int = 1
}
struct BoyViews: View {
//    @State var userLevel = 0
    
    @Binding var shouldPopToRootView : Bool
    
    @State var usergender = "unknown"
    
    @State var option : Int = 1
    
    @EnvironmentObject var env : Environment1
    //@Binding var shouldPopToRootView : Bool
//    var env : Environment1
    @State var size : CGFloat = (UIScreen.main.bounds.size.height * 0.2)
    
    var body: some View {
        //self.shouldPopToRootView = false
        
        if getGender() == "male"{
        switch env.num {
            case 1:
//                self.shouldPopToRootView = false
                return AnyView(face1bView(shouldPopToRootView: self.$shouldPopToRootView))
            case 2:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 3:
                return AnyView(face2bView(shouldPopToRootView: self.$shouldPopToRootView))
            case 4:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 5:
                return AnyView(face3bView(shouldPopToRootView: self.$shouldPopToRootView))
            case 6:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 7:
                return AnyView(face4bView(shouldPopToRootView: self.$shouldPopToRootView))
            case 8:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
        case 9:
            return AnyView(face5bView(shouldPopToRootView: self.$shouldPopToRootView))
        case 10:
            return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 11:
                return AnyView(EndView())
                
            default:
                return AnyView(Text("End"))
            }
        } else{
            switch env.num  {
                case 1:
                    return AnyView(face1gView(shouldPopToRootView: self.$shouldPopToRootView))
                case 2:
                    return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
                case 3:
                    return AnyView(face2gView(shouldPopToRootView: self.$shouldPopToRootView))
                case 4:
                    return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
                case 5:
                    return AnyView(face3gView(shouldPopToRootView: self.$shouldPopToRootView))
                case 6:
                    return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
                case 7:
                    return AnyView(face4gView(shouldPopToRootView: self.$shouldPopToRootView))
                case 8:
                    return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
                case 9:
                    return AnyView(face5gView(shouldPopToRootView: self.$shouldPopToRootView))
                case 10:
                    return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
                case 11:
                    return AnyView(EndView())
                    
                default:
                    return AnyView(Text("End"))
                }
        }

    }
    
    //get gender from database
    func getGender()->String{
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()

        ref.child("User/\(userID ?? "")/Gender").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            self.usergender = snapshot.value as? String ?? ""
            print("2 gender")
            print(usergender)
        });
        return usergender
    }
    
//    func setCurrentLevel(){
//        let userID = Auth.auth().currentUser?.uid
//    //store user state to database
//    let ref = Database.database().reference()
//    ref.child("EmotionalFaceActivity").child("CurrentLevel").child(userID ?? " ").updateChildValues(["LastLevel":env.num])
//    }
//
//    func getCurrentLevel()->Int{
//       let userID = Auth.auth().currentUser?.uid
//       let ref = Database.database().reference()
//       ref.child("EmotionalFaceActivity/CurrentLevel/\(userID ?? " ")/LastLevel").getData(completion:  { error, snapshot in
//           guard error == nil else {
//               print(error!.localizedDescription)
//               return;
//           }
//           self.env.num = snapshot.value as? Int ?? 0
//
//       });
//       return env.num
//   }

}

//struct BoyViews_Previews: PreviewProvider {
//    static var previews: some View {
//        BoyViews()
//    }
//}
