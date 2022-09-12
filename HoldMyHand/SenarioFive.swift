//
//  SenarioFive.swift
//  HoldMyHand
//
//  Created by loka mloka on 18/09/1443 AH.
//

import SwiftUI

struct SenarioFive: View {
    @Binding var shouldPopToRootView : Bool
    
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
            HStack {
                
                Spacer()
                Text("وقعت من دراجتي").bold() .font(.largeTitle)
                    .statusBar(hidden: true)   .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                    .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255, opacity: 1.0))
                HStack{
                    Spacer()
                        .frame(width: 400)
                    
                    Button (action: { self.shouldPopToRootView = false } ){
                        Image(systemName: "house.fill")
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                            .frame(width: 60, height: 55)
                    }.navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: backButton)

                    
                    Spacer()
                        .frame(width: 30)
                }
            }
            Spacer()
                .frame(width: 100)
            VStack(alignment: .center, spacing: 8){
                Image("byc")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 200)
                    .frame(width:500,height:500)
                    .frame(maxWidth: .infinity)
                
                
            }
            .frame(width: 500, height: 350)
            .background(Color.white).border(Color(red:84/255, green: 165/255,blue: 218/255)).cornerRadius(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
            
            HStack {
                
                Text(" وقعت من دراجتي اثناء اللعب \n  انا أشعر ......")
                
                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }
            Spacer()
                .frame(width: 30)
        }
        
    }
}


