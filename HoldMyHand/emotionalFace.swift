//
//  emotionalFace.swift
//  HoldMyHand
//
//  Created by loka mloka on 19/08/1443 AH.
//

import SwiftUI

struct emotionalFace: View {
    @EnvironmentObject var env : Environment1
    @State var gender = "ذكر"
    
    @Binding var shouldPopToRootView : Bool
//    @State var isActive : Bool = false
    
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
        VStack{
           
            Spacer()
                .frame(width:200 , height:80)

            
            Text("الأوجه التعبيرية")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255))
            
            Spacer()
                .frame(width:200 , height:80)
            
            //shouldPopToRootView: self.$isActive
           HStack(spacing: 60){
            //NavigationLink(destination: BoyViews(shouldPopToRootView: self.$isActive),isActive: self.$isActive, label: {

                NavigationLink(destination: BoyViews(shouldPopToRootView: self.$shouldPopToRootView),label:{
                    VStack(alignment: .center, spacing: 20){
                    Image("وصل")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 278.0 ,height: 220.0)
                    
                       Divider()
                           .frame(width: 300, height: 1)
                           .background(Color(red: 141/255, green: 208/255, blue: 235/255))
                       
                       Text("لنوصِّل")
                           .font(.largeTitle)
                           .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                    }.frame(width: 350, height: 420)
                    .background(Color.white).border(Color(red: 141/255, green: 208/255, blue: 235/255)).cornerRadius(3)
            }).isDetailLink(false)
//                .isDetailLink(false)
            //})
//            .isDetailLink(false)
         //firstLearnView()
       NavigationLink(destination: learnView(shouldPopToRootView: self.$shouldPopToRootView), label: {
           VStack(alignment: .center, spacing: 20){
               Image("emotional-facexx")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 278.0 ,height: 220.0)
                   //.frame(maxWidth: .infinity)
               Divider()
                   .frame(width: 300, height: 1)
                   .background(Color(red: 141/255, green: 208/255, blue: 235/255))
               
               Text("لنتعلم")
                   .font(.largeTitle)
                   .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
           }
         .frame(width: 350, height: 420)
         .background(Color.white).border(Color(red: 141/255, green: 208/255, blue: 235/255)).cornerRadius(3)
       }).isDetailLink(false)
//       .isDetailLink(false)
       }
            Spacer()
                .frame(width:200 , height:170)
    }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

}

//struct emotionalFace_Previews: PreviewProvider {
//    static var previews: some View {
//        emotionalFace()
//            .rotationEffect(.init(degrees: 90.0))
////.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
