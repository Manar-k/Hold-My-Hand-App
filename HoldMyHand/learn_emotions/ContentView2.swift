import SwiftUI
import AVKit
import AVFoundation
//import AVFAudio
import AVFoundation


struct ContentView2: View {
    
    
    
    
    var player: AVAudioPlayer!
    
    var body: some View {
        
        NavigationView{
            VStack  {
                HStack{
                    Image(systemName: "house.fill")
                        .resizable(resizingMode: .stretch)
                        .foregroundColor(Color(red: 84/255, green: 165/255, blue: 218/255))
                        .frame(width: 60, height: 55)
                    Spacer()
                    Text("لنتعلم الأوجه التعبيرية")  
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                    
                    
                        .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255, opacity: 1.0))
                    Spacer()
                    
                    
                }.onAppear{
                    SoundG.instance.soundemo()
                }
                
//                TabView{
//                    
//                    
//                    OnboardView(systemImageName:"Sadg ", systemImageName2: "Happyg", 
//                                description:("وجه حزين"), 
//                                description2:("وجه سعيد")
//                                
//                    )
//                    
//                    
//                    OnboardView2(systemImageName:"Angrryg ", systemImageName2: "Calmg ", 
//                                description:("وجه غاضب"), 
//                                description2:("وجه هادئ")
//                    )
//                    
//                    OnboardView3(systemImageName:"Shyg", systemImageName2: "Sleepg ", 
//                                description:("وجه خجول"), 
//                                description2:("وجه نعسان")
//                    )
//                    
//                    OnboardView4(systemImageName:"Sickg", systemImageName2: "Excitedg",
//                                description:("وجه مريض"), 
//                                description2:("وجه متحمس")
//                                
//                    )
//                    
//                    OnboardView5(systemImageName:"Supr", systemImageName2: "Scardg", 
//                                description:("وجه متفاجئ"), 
//                                description2:("وجه خائف")
//                                
//                    )
//                }.tabViewStyle(PageTabViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                .tabViewStyle(.page(indexDisplayMode: .always))
//
//
//
//                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .onAppear(perform: {
                //MARK: عند تحميل الواجهه استدعي التابع 
                SoundG.instance.soundemo()
            })
    }

//    struct OnboardView1: View {
//
//        @State var audioPlayer: AVAudioPlayer?
//        @State var isPlaying : Bool = false
//
//        let systemImageName: String
//        let systemImageName2: String
//        let description: String
//        let description2: String
//
//
//        var body: some View {
//
//            VStack (spacing : 100) {
//
//                HStack{
//
//                    VStack{//image and text
//                        Image(systemImageName)
//                            .resizable()
//                            .frame(width: 350, height: 350)
//
//                        HStack(spacing : 15){Text(description)
//                                .font(.largeTitle)
//                            //  .frame(width: 50, height: 50)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
//                                .multilineTextAlignment(.trailing)
//                                .lineLimit(13)
//
//                            Button (action: {
//                                SoundG.instance.SadSound()
//                            } )
//                            {
//                            Image(systemName: ("speaker.2.fill"))
//                            //speaker icon
//                                .resizable(resizingMode: .stretch)
//                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
//                                .frame(width: 25, height: 25)
//
//                            // Spacer()
//                            //     .frame(width: 50.0, height: 200.0
//                                }
//
//                        }
//                    }
//
//                    VStack{  //same as above
//                        Image(systemImageName2)
//                            .resizable()
//                            .frame(width: 350, height: 350)//150.0
//
//
//                        HStack(spacing : 15){Text(description2)
//                                .font(.largeTitle)
//                            //  .frame(width: 50, height: 50)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
//                                .multilineTextAlignment(.trailing)
//                                .lineLimit(13)
//
//                            Button (action: {
//                                SoundG.instance.HappySound()
//                            } )
//                            {
//                            Image(systemName: ("speaker.2.fill"))
//                            //speaker icon
//                                .resizable(resizingMode: .stretch)
//                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
//                                .frame(width: 25, height: 25)
//
//                            // Spacer()
//                            //     .frame(width: 50.0, height: 200.0
//                                }
//                        }
//                    }
//
//                }
//                Spacer()
//                    .frame(width: 50.0, height: 80.0)
//            }
//
//
//        }
//
//
//
//        func soundGl () {
//            if let path = Bundle.main.path(forResource: "emo face", ofType: "wav") {
//
//                self.audioPlayer = AVAudioPlayer()
//
//                self.isPlaying.toggle()
//
//                let url = URL(fileURLWithPath: path)
//
//                do {
//                    self.audioPlayer = try AVAudioPlayer(contentsOf: url)
//                    self.audioPlayer?.prepareToPlay()
//                    self.audioPlayer?.play()
//                }catch {
//                    print("Error")
//                }
//            }
//        }
//
//    }
    
}
struct OnboardView1: View {
    
    @State var audioPlayer: AVAudioPlayer?
    @State var isPlaying : Bool = false
    
    let systemImageName: String
    let systemImageName2: String
    let description: String
    let description2: String
    
    
    var body: some View {
        
        VStack (spacing : 100) {
            
            HStack{
                
                VStack{//image and text
                    Image(systemImageName)
                        .resizable()
                        .frame(width: 350, height: 350)
                    
                    HStack(spacing : 15){Text(description)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.SadSound()
                        } )
                        {
                        Image(systemName: ("speaker.2.fill"))
                        //speaker icon
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .frame(width: 25, height: 25)
                        
                        // Spacer()
                        //     .frame(width: 50.0, height: 200.0
                            }
                        
                    }
                }
                
                VStack{  //same as above
                    Image(systemImageName2)
                        .resizable()
                        .frame(width: 350, height: 350)//150.0
                    
                    
                    HStack(spacing : 15){Text(description2)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.HappySound()
                        } )
                        {
                        Image(systemName: ("speaker.2.fill"))
                        //speaker icon
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .frame(width: 25, height: 25)
                        
                        // Spacer()
                        //     .frame(width: 50.0, height: 200.0
                            }
                    }
                }
                
            }
            Spacer()
                .frame(width: 50.0, height: 80.0)
        }
        
        
    }
    
    
    
    func soundGl () {
        if let path = Bundle.main.path(forResource: "emo face", ofType: "wav") {
            
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

struct OnboardView2: View {
    
    
    
    let systemImageName: String
    let systemImageName2: String
    let description: String
    let description2: String
    
    
    var body: some View {
        
        VStack (spacing : 100) {
            
            HStack{
                
                VStack{//image and text
                    Image(systemImageName)
                        .resizable()
                        .frame(width: 350, height: 350)
                    
                    HStack(spacing : 15){Text(description)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.AngrySound()
                        } )
                        {
                        Image(systemName: ("speaker.2.fill"))
                        //speaker icon
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .frame(width: 25, height: 25)
                        
                        // Spacer()
                        //     .frame(width: 50.0, height: 200.0
                            }
                        
                    }
                }
                
                VStack{  //same as above
                    Image(systemImageName2)
                        .resizable()
                        .frame(width: 350, height: 350)//150.0
                    
                    
                    HStack(spacing : 15){Text(description2)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.clamSound()
                        } )
                        {
                        Image(systemName: ("speaker.2.fill"))
                        //speaker icon
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .frame(width: 25, height: 25)
                        
                        // Spacer()
                        //     .frame(width: 50.0, height: 200.0
                            }
                    }
                }
                
            }
            Spacer()
                .frame(width: 50.0, height: 80.0)
        }
        
        
    }
    
    
    }


struct OnboardView3: View {
    
    
    
    let systemImageName: String
    let systemImageName2: String
    let description: String
    let description2: String
    
    
    var body: some View {
        
        VStack (spacing : 100) {
            
            HStack{
                
                VStack{//image and text
                    Image(systemImageName)
                        .resizable()
                        .frame(width: 350, height: 350)
                    
                    HStack(spacing : 15){Text(description)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.ShySound()
                        } )
                        {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                            
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                        
                    }
                }
                
                VStack{  //same as above
                    Image(systemImageName2)
                        .resizable()
                        .frame(width: 350, height: 350)//150.0
                    
                    
                    HStack(spacing : 15){Text(description2)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.sleepSound()
                        } )
                        {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                            
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                    }
                }
                
            }
            Spacer()
                .frame(width: 50.0, height: 80.0)
        }
        
        
    }
    
    
}


struct OnboardView4: View {
    
    
    
    let systemImageName: String
    let systemImageName2: String
    let description: String
    let description2: String
    
    
    var body: some View {
        
        VStack (spacing : 100) {
            
            HStack{
                
                VStack{//image and text
                    Image(systemImageName)
                        .resizable()
                        .frame(width: 350, height: 350)
                    
                    HStack(spacing : 15){Text(description)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.sickSound()
                        } )
                        {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                            
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                        
                    }
                }
                
                VStack{  //same as above
                    Image(systemImageName2)
                        .resizable()
                        .frame(width: 350, height: 350)//150.0
                    
                    
                    HStack(spacing : 15){Text(description2)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.excitedSound()
                        } )
                        {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                            
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                    }
                }
                
            }
            Spacer()
                .frame(width: 50.0, height: 80.0)
        }
        
        
    }
    
    
}



struct OnboardView5: View {
    
    @Binding var shouldPopToRootView : Bool
    
    let systemImageName: String
    let systemImageName2: String
    let description: String
    let description2: String
    
    
    var body: some View {
        
        VStack (spacing : 100) {
            VStack{
            HStack{
                
                VStack{//image and text
                    Image(systemImageName)
                        .resizable()
                        .frame(width: 350, height: 350)
                    
                    HStack(spacing : 15){Text(description)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.playSound2()
                        } )
                        {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                            
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                        
                    }
                }
                
                VStack{  //same as above
                    Image(systemImageName2)
                        .resizable()
                        .frame(width: 350, height: 350)//150.0
                    
                    
                    HStack(spacing : 15){Text(description2)
                            .font(.largeTitle)
                        //  .frame(width: 50, height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .multilineTextAlignment(.trailing)
                            .lineLimit(13)
                        
                        Button (action: {
                            SoundG.instance.scaredSound()
                        } )
                        {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                            
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                    }
                }
                
                Spacer()
                    .frame(width: 50.0, height: 80.0)
            }
            
            
            Button (action:{
                /*self.mystate = "\(self.username) and \(self.password)"
                 print("\(self.username) and \($password)")*/
            })
            {
                NavigationLink(destination: BoyViews(shouldPopToRootView: self.$shouldPopToRootView), label: {
                HStack{
                    Text("ابدأ التوصيل")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                    
                    //Text("\(mystate)")
                }.frame(width: 200, height: 50, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(red:84/255, green: 165/255,blue: 218/255)))
                })
                
            }
                Spacer()
        }
            
            
            
        }
        
        
    }
    
    
}


