//
//  massegexlant.swift
//  face
//
//  Created by Bayan on 28/07/1443 AH.
//

//import SwiftUI
//
//struct massegexlant: View {
//    @EnvironmentObject var env : Environment1
//
//    var body: some View {
//
//        HStack(alignment: .top){
//
//
//        Image("exit")
//            .renderingMode(.original)
//            .resizable()
//            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
//            VStack{
//                Image("Cllap")
//
//                    HStack{
//                        NavigationLink(destination:face2bView(),label: {
//                    Image("next")
//                        .renderingMode(/*@START_MENU_TOKEN@*/.original/*@END_MENU_TOKEN@*/)
//                        .resizable()
//                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
//                        .onTapGesture {
//                            env.num += 1
//                        }
//
//                        Spacer()
//                            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
//                        Text("أحسنت")
//                            .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(1)
//                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
//                    })
//                }
//
//
//            }
//    }
//    }
//
//struct massegexlant_Previews: PreviewProvider {
//    static var previews: some View {
//        massegexlant()
////.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
//}
import SwiftUI
import Foundation
//import AVFAudio
import AVFoundation


struct massegexlant: View {
    @Binding var shouldPopToRootView : Bool
    
    @EnvironmentObject var env : Environment1
    @State var size : CGFloat = (UIScreen.main.bounds.size.height * 0.2)
    
    
    @State var audioPlayer: AVAudioPlayer?
    @State var isPlaying : Bool = false

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
      
        VStack(alignment: .leading){
            
            
            
            HStack(alignment: .top){
       
                Spacer()
                    .frame(width: 600.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    
            Button (action: { self.shouldPopToRootView = false } ){
            Image("exit")
                .renderingMode(.original)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                }
            }
            
            VStack{
                
                
                
                
                Image("Cllap")
                    .resizable()
                    .frame(width:  size * 1.5 , height: size * 1.5)

                    
                    
                    
                    
                   
                    HStack{
                        NavigationLink(destination:face2bView(shouldPopToRootView: self.$shouldPopToRootView),label: {
                            
                           
                    Image("next")
                        .renderingMode(/*@START_MENU_TOKEN@*/.original/*@END_MENU_TOKEN@*/)
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            env.num += 1
                        }
                            Spacer()
                                .frame(width: 150, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        
                        Text("أحسنت")
                            .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                            Spacer()
                                .frame(width: 250.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    })
                }

        
            }
    }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .onAppear{
        soundCllap()
    }.border(Color(red: 141/255, green: 208/255, blue: 235/255)).cornerRadius(3)
            
    }
    
    
    func soundCllap () {
        if let path = Bundle.main.path(forResource: "clapsound¬", ofType: ".mp3") {

                    self.audioPlayer = AVAudioPlayer()

                    self.isPlaying.toggle()

                    let url = URL(fileURLWithPath: path)

                    do {
                        self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                        self.audioPlayer?.prepareToPlay()
                        self.audioPlayer?.play()
                    }catch {
                        print("Error")
                    }
    }
}
    

//struct massegexlant_Previews: PreviewProvider {
//    static var previews: some View {
//        massegexlant()
////.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
}
