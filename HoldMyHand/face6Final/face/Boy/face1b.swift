import SwiftUI

//import AVFAudio
import AVFoundation


struct face1bView: View {
    @EnvironmentObject var env : Environment1
    
    @Binding var shouldPopToRootView : Bool
    
    @State var audioPlayer: AVAudioPlayer?
    @State var isPlaying : Bool = false
    
    @State var is1Desabeled = false
    @State var is2Desabeled = false
    
    @State var isHint : Bool = false
    @State var is2Hint : Bool = false
    
    @State var isImage1Select : Bool = false
    @State var isImage2Select : Bool = false
    
    @State var isText1Select : Bool = false
    @State var isText2Select : Bool = false
    
    @State var is1True : Bool = false
    @State var is2True : Bool = false
    
    @State var text1Color : Color = Color.blue
    @State var text2Color : Color = Color.blue
    
    @State var framColor1 : Color = Color.gray
    @State var framColor2 : Color = Color.gray

    @State var isSelectSomeThing : Bool = true
    
    @State var size : CGFloat = (UIScreen.main.bounds.size.height * 0.2)

    
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
            ScrollView{
              
                HStack{
                    Text("1/5")
                        .font(.title)
                        .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                    Spacer()
                    Text("وصل الآوجه التعبيرية")
                        .font(.title)
                        .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                    Button (action: { self.shouldPopToRootView = false } ){
                    Image(systemName: "house.fill")
                                    .resizable(resizingMode: .stretch)
                                    .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                        .frame(width: 60, height: 55)
//                                    .frame(width: 100, height: 95)
                    }
//                    Image(systemName: "house.fill")
//                                    .resizable(resizingMode: .stretch)
//                                    .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
//                                    .frame(width: 100, height: 95)


                }
                .padding()
                Spacer()

                HStack{
                    Spacer()
                 
                }
                Spacer()
//MARK: first
                
                
                
                
                
                
                HStack{
                    
                    Spacer()
                        .frame(width: 160.0, height: 100.0)
                    
                    ZStack {
                        if isText1Select {
                                Rectangle()
                                    .foregroundColor(framColor1)
                                    .frame(width: size, height: 40 )
                                    .cornerRadius(25)
                            }
                        Text("وجه سعيد")
                            .font(.title)
                            .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                            .onTapGesture {
                                isText1Select.toggle()
                                text1Color = isText1Select ? Color.white : Color.blue
                                if isImage2Select && isText1Select{
                                    is1True = true
                                    framColor1 = .green
                                    is1Desabeled = true
                                    isSelectSomeThing.toggle()
                                }else if isImage1Select && isText1Select {
                                    is1True = false
                                    framColor1 = .red
                                }else {
                                    framColor1 = .gray
                                }
                                
                            }
                            .disabled(isSelectSomeThing)
                            .disabled(is1Desabeled)

                   

                    }


                
                    if isHint {

                        Image("Happy")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
         
                    Spacer()
 
                    
                    
                    
                    ZStack {
                        
                        if isImage1Select {
                            Rectangle()
                                .foregroundColor(framColor2)
                                .frame(width: size + 5, height: size)
                                .cornerRadius(20)
                                
                                
                        }
                        
           
                        Image("Sad")
                            .resizable()
                            .frame(width: size , height: size)
                            .onTapGesture {
                                isImage1Select.toggle()
                                isSelectSomeThing = !isImage1Select
                        }
                            .disabled(is2Desabeled)

                    }
                    
                    Image("hint-1")
                                            .resizable()
                                            .frame(width: CGFloat(size * 0.5) , height: CGFloat(size * 0.5) )
                                            .padding()
                                            .onTapGesture {
//                                                isHint.toggle()
                                             is2Hint.toggle()
                                            }
       

                }
                .padding()
                
                
                
//MARK: Second
                HStack{
                    Spacer()
                        .frame(width: 160.0, height: 100.0)
                    ZStack {
                        if isText2Select {
                            Rectangle()
                                .foregroundColor(framColor2)
                                .frame(width: size, height: 40 )
                                .cornerRadius(25)
                         
                            
                        }
                        
                        Text("وجه حزين")
                            .font(.title)
                            .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                            .onTapGesture {
                                isText2Select.toggle()
                                text2Color = isText2Select ? Color.white : Color.blue
                                if isImage1Select && isText2Select{
                                    is2True = true
                                    framColor2 = .green
                                    is2Desabeled = true
                                    isSelectSomeThing.toggle()
                                }else if isImage2Select && isText2Select {
                                    is2True = false
                                    framColor2 = .red
                                }else {
                                    framColor2 = .gray
                                }
                            }
                            .disabled(is2Desabeled)
                            .disabled(isSelectSomeThing)
                       
                    }


                    if is2Hint {
                        Image("Sad")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                    Spacer()
                    ZStack {
                        if isImage2Select {
                            Rectangle()
                                .foregroundColor(framColor1)
                                .frame(width: size + 5, height: size)
                                .cornerRadius(20)
                                
                                
                        }
                        Image("Happy")
                            .resizable()
                            .frame(width: size, height: size)
                            
                            .onTapGesture {
                                isImage2Select.toggle()
                                isSelectSomeThing = !isImage2Select
                                
                        }
                            .disabled(is1Desabeled)
                         //   .disabled(isActive)

                    }
                      
                    Image("hint-1")
                                            .resizable()
                                            .frame(width: CGFloat(size * 0.5) , height: CGFloat(size * 0.5) )
                                            .padding()
                                            .onTapGesture {
                                                isHint.toggle()
//                                                is2Hint.toggle()
                                         }
                    
                }
                .padding()
                
//MARK: end
                    
               Spacer()
                Button {
                    env.num += 1
                    activityStatus.Status.setLevel_1()
                } label: {
                    Text("ارسال")
                    .frame(width: size * 2, height: 40)
                    .background(Color(red:84/255, green: 165/255,blue: 218/255))
                    .cornerRadius(20)
                    .foregroundColor(.white)
                }
                .disabled(!(is2True && is1True))

            }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
            .onAppear{
                soundBoy()
            }
        }
        func soundBoy () {
            if let path = Bundle.main.path(forResource: "SoundTrackBoy", ofType: ".mp3") {

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

    }


//struct face1bView_Previews: PreviewProvider {
//    static var previews: some View {
//        face1bView()
////.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
