import SwiftUI

import Foundation
//import AVFAudio
import AVFoundation
import Firebase
struct MassegeView: View {
    
    
    @EnvironmentObject var env : Environment1
    
    @Binding var shouldPopToRootView : Bool
    
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
                        Button {
                            env.num += 1
////                            env.num += getCurrentLevel()
//                            env.num += getCurrentLevel()+1
                        } label: {
                            Image("next")
                                .renderingMode(/*@START_MENU_TOKEN@*/.original/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            
                        }

                        
                        Spacer()
                            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        Text("أحسنت")
                            .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        Spacer()
                            .frame(width: 250.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        

                    }
                

            }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }.onAppear{
        soundCllap1()
    }.border(Color(red: 141/255, green: 208/255, blue: 235/255)).cornerRadius(3)
    }
    
    
    func soundCllap1 () {
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

    
    

//struct MassegeView_Previews: PreviewProvider {
//    static var previews: some View {
//        MassegeView()
////.previewInterfaceOrientation(.landscapeLeft)
//
//    }
//}
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
