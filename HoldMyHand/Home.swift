//
//  Home.swift
//  HoldMyHand
//
//  Created by loka mloka on 05/08/1443 AH.
//

import SwiftUI
import Firebase

struct Home: View {
//    init(){
//        let value = UIInterfaceOrientation.landscapeLeft.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//    }
    @EnvironmentObject var env : Environment1
    
    @EnvironmentObject var settings: userSetting
    
    @State var isActive : Bool = false
    
    @State var isActive1 : Bool = false

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
        NavigationView{
     VStack{

        HStack{
            Image("لوقو اصلي 1")
                .resizable()
                .frame(width:255 , height:220)
            Spacer()//800 w , h 100
                .frame(width: 800, height: 100)
          //  NavigationLink(Destination: Text"Destination"), lable: {
         //       text"Next Screen"
          //  }
            //VStack{
            HStack{

            NavigationLink(destination: progressView(), label: {
                Image("user-2")
                .resizable()
                .frame(width:60 , height:60)

            })
                Spacer()
                    .frame(width: 15)
                Button(action: {
                    do {
                        try Auth.auth().signOut()
                        print("Sign out successfuly")
                    } catch {
                        print("Sign out error")
                    }
                    settings.isLoggedIn = false
                    env.num = 1
                }) {
                    Image("logout")
                    .resizable()
                    .frame(width:60 , height:60)
                }
//                Image("logout")
//                .resizable()
//                .frame(width:60 , height:60)
                Spacer()
                    .frame(width: 50)
            }
          //      Spacer()
          //          .frame(height: 90)
          //  }
        }
         Text("الصفحة الرئيسية")
             .font(.largeTitle)
             .fontWeight(.bold)
             .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255))

         Spacer()
             .frame(width:200 , height:30)


        HStack(spacing: 60){
            NavigationLink(destination: ScenariosView(shouldPopToRootView: self.$isActive1), isActive: self.$isActive1, label: {
        VStack(alignment: .center, spacing: 20){
            Image("المشهد العاطفي")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 278.0 ,height: 220.0)
                //.frame(maxWidth: .infinity)
            Text("المشهد العاطفي")
                .font(.largeTitle)
                .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
        }
      .frame(width: 350, height: 420)
      .background(Color.white).border(Color(red: 141/255, green: 208/255, blue: 235/255)).cornerRadius(3)
            }).isDetailLink(false)
//            .isDetailLink(false)
    NavigationLink(destination: emotionalFace(shouldPopToRootView: self.$isActive), isActive: self.$isActive, label: {
        VStack(alignment: .center, spacing: 20){
            Image("emotional-facexx")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 278.0 ,height: 220.0)
                //.frame(maxWidth: .infinity)
            Text("الأوجه التعبيرية")
                .font(.largeTitle)
                .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
        }
      .frame(width: 350, height: 420)
      .background(Color.white).border(Color(red: 141/255, green: 208/255, blue: 235/255)).cornerRadius(3)
    }).isDetailLink(false)
    }
         Spacer()
             .frame(width:200 , height:170)
     }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)

    }
        
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
