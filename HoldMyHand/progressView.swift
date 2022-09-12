//
//  progressView.swift
//  HoldMyHand
//
//  Created by loka mloka on 19/08/1443 AH.
//

import SwiftUI
import Firebase

struct progressView: View {
    @State var userName = "unknown name"
    
    @State var activity1Status = "unknown"
    @State var activity2Status = "unknown"
    @State var activity3Status = "unknown"
    @State var activity4Status = "unknown"
    @State var activity5Status = "unknown"
    //let status = activityStatus()
//    @State var activityStatus = "unknown"
//
//    @State var complete = "1"

    @State var completeColor : Color = Color.green
    @State var uncompleteColor : Color = Color(red: 229/255, green: 229/255, blue: 229/255, opacity: 1.0)
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var backButton : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName:"chevron.left") // BackButton Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    Text("العودة") //translated Back button title
                }
            }
        }
    
    var body: some View {
      //  NavigationView{
        VStack(spacing: 20){
            HStack(){
                //450 w
                Spacer()
                    .frame(width: 300, height: 10)
                let vname = getUName()
                Text("تقدم "+vname)
                    .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                    .font(.largeTitle)
                //420 w
                Spacer()
                    .frame(width: 300, height: 10)
            
      //  NavigationLink(destination: Home(),
      //     label: {
       //     Image(systemName: "house.fill")
        //        .resizable(resizingMode: .stretch)
         //       .foregroundColor(Color(red: 84/255, green: //165/255, blue: 218/255))
          //      .frame(width: 100, height: 95)
        //})
            }
            
         Spacer()
                .frame(width: 10, height: 20)
            
        HStack(spacing: 50){
          VStack(spacing: 25){
                Text("المستوى الثالث")
                    .font(.title)
                    .foregroundColor(Color(red: 141/255, green: 208/255,blue:235/255))
            if getLevel_3() == "1"{
                Circle()
                 .frame(width: 180, height: 180)
                 .foregroundColor(completeColor)
            } else {
                Circle()
                  .frame(width: 180, height: 180)
                  .foregroundColor(uncompleteColor)
            }
            }
        VStack(spacing: 25){
                Text("المستوى الثاني")
                    .font(.title)
                    .foregroundColor(Color(red: 141/255, green: 208/255,blue:235/255))
            if getLevel_2() == "1"{
               Circle()
                 .frame(width: 180, height: 180)
                 .foregroundColor(completeColor)
            } else {
                Circle()
                  .frame(width: 180, height: 180)
                  .foregroundColor(uncompleteColor)
            }
        }
            
        VStack(spacing: 25){
                Text("المستوى الأول")
                    .font(.title)
                    .foregroundColor(Color(red: 141/255, green: 208/255,blue:235/255))
            if getLevel_1() == "1"{
                Circle()
                 .frame(width: 180, height: 180)
                 .foregroundColor(completeColor)
            } else {
                Circle()
                  .frame(width: 180, height: 180)
                  .foregroundColor(uncompleteColor)
            }
        }
     }
        
            Spacer()
                .frame(width: 450, height: 5)
            
    HStack(spacing: 50){
        VStack(spacing: 25){
                Text("المستوى الخامس")
                    .font(.title)
                    .foregroundColor(Color(red: 141/255, green: 208/255,blue:235/255))
            if getLevel_5() == "1"{
                Circle()
                 .frame(width: 180, height: 180)
                 .foregroundColor(completeColor)
            } else {
                Circle()
                  .frame(width: 180, height: 180)
                  .foregroundColor(uncompleteColor)
            }
        }
            
        VStack(spacing: 25){
            Text("المستوى الرابع")
                .font(.title)
                .foregroundColor(Color(red: 141/255, green: 208/255,blue:235/255))
            if getLevel_4() == "1"{
               Circle()
                 .frame(width: 180, height: 180)
                 .foregroundColor(completeColor)
            } else {
                Circle()
                  .frame(width: 180, height: 180)
                  .foregroundColor(uncompleteColor)
            }
        }
            
     }
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    //}
     //   .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func getUName()->String{
        //Database.database().isPersistenceEnabled = true
//        let settings = FirestoreSettings()
//        settings.isPersistenceEnabled = true
//        let userRef = Database.database().reference(withPath: "User")
//        userRef.keepSynced(true)
        
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
//        ref.child("User").child(userID!).observeSingleEvent(of: .value, with: { snapshot in
//                  // Get user value
//                  let value = snapshot.value as? NSDictionary
//            userName = value?["Name"] as? String ?? ""
//                  //let user = User(Name: Name)
//
//                  // ...
//                }) { error in
//                  print(error.localizedDescription)
//                }
        ///Name
        ref.child("User/\(userID ?? "")/Name").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            self.userName = snapshot.value as? String ?? ""
            print("2")
            print(userName)
        });
        return userName
    }
    //get gender from database
//    func getGender()->String{
//        let userID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference()
//
//        ref.child("User/\(userID ?? "")/Gender").getData(completion:  { error, snapshot in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return;
//            }
//            self.userName = snapshot.value as? String ?? ""
//            print("2 gender")
//            print(userName)
//        });
//        return userName
//    }
    
    //get Activity Status of level one from database
     func getLevel_1()->String{
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_1").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            self.activity1Status = snapshot.value as? String ?? ""

        });
        return activity1Status
    }
    
    func getLevel_2()->String{
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()

        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_2").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            self.activity2Status = snapshot.value as? String ?? ""

        });
        return activity2Status
    }
    
    //get level 3
    func getLevel_3()->String{
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()

        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_3").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            self.activity3Status = snapshot.value as? String ?? ""

        });
        return activity3Status
    }
    
    //get level 4
    func getLevel_4()->String{
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()

        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_4").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            self.activity4Status = snapshot.value as? String ?? ""

        });
        return activity4Status
    }
    
    func getLevel_5()->String{
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()

        ref.child("EmotionalFaceActivity/Status/\(userID ?? " ")/Level_5").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            self.activity5Status = snapshot.value as? String ?? ""

        });
        return activity5Status
    }
}

struct progressView_Previews: PreviewProvider {
    static var previews: some View {
        progressView()
            .rotationEffect(.init(degrees: 90.0))
    }
}
