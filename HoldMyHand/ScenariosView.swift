//
//  ScenariosView.swift
//  HoldMyHand
//
//  Created by loka mloka on 19/08/1443 AH.
//

import SwiftUI

struct ScenariosView: View {
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
//        NavigationView{
        VStack  {
        HStack{
            Spacer()
            Text("المشهد العاطفي")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
            
            
                .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255, opacity: 1.0))
            HStack{
                Spacer()
                    .frame(width: 400)
                
                Button (action: { self.shouldPopToRootView = false } ){
                    Image (systemName: "house.fill")
                        .resizable(resizingMode: .stretch)
                        .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                        .frame(width: 60, height: 55)
                }
                Spacer()
                    .frame(width: 30)
            }

        }
                TabView{
                    HStack{
                        NavigationLink( destination: ScenarioOne(shouldPopToRootView: self.$shouldPopToRootView),label: {
                    OnboardView(systemImageName: "Gift",description:("هدية الميلاد"))
                    })
                    }
                    HStack{
                    NavigationLink( destination: ScenarioFour(shouldPopToRootView: self.$shouldPopToRootView),label: {
                        OnboardView(systemImageName:"Mom",description:("هدايا أمي"))
                    })
                    }
                    HStack{
                    NavigationLink( destination: SenarioTwo(shouldPopToRootView: self.$shouldPopToRootView)){
                        OnboardView(systemImageName:"Play",
                                    description:("اللعب مع الاصدقاء"))}
                    }
                    HStack{
                    NavigationLink( destination: SenarioThree(shouldPopToRootView: self.$shouldPopToRootView)){
                        OnboardView(systemImageName:"Don’t play ",
                                    description:("الاطفال لا يريدون اللعب "))}
                    }
                    
                    HStack{
                    NavigationLink( destination: SenarioFive(shouldPopToRootView: self.$shouldPopToRootView),label: {
                        OnboardView(systemImageName:"byc",description:("وقعت من دراجتي"))
                    })
                    }
                }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
 
               
                Spacer()
            }
//}.navigationViewStyle(StackNavigationViewStyle())
        }


struct OnboardView: View {
    
    
    let systemImageName: String
    let description: String
    
    
    var body: some View {
        
VStack (spacing : 100) {

    VStack(alignment: .center, spacing: 8){
        Image( systemImageName )
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            
        
        Text(description)
            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
        
    }
    .frame(width: 430, height: 490)
    .background(Color.white).border(Color(red:84/255, green: 165/255,blue: 218/255)).cornerRadius(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
    
}
        
    
        }
    }
    }
