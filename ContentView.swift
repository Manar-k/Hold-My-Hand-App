import SwiftUI
import AVFoundation
import AVKit

struct ContentView: View {
    
    // @State var player: AVAudioPlayer = "وجه-حزين.mp3"
    var player: AVAudioPlayer!
    // @_functionBuilder struct ViewBuilder
    
    @ViewBuilder
    var body: some View {
        
        NavigationView{
                    VStack  {
                        HStack{
                            Image(systemName: "house.fill")
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 60, height: 55)
                            Spacer()
                            Text("لنتعلم الأوجه التعبيرية")  
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            
                            
                                .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255, opacity: 1.0))
                            Spacer()
                            
                            
                        }
                        
                        TabView{
                            
                            
                                OnboardView(systemImageName:"Sad", systemImageName2: "Happy", 
                                    description:("وجه حزين"), 
                                            description2:("وجه سعيد")
                                
                                        )
                                
                            
                            OnboardViewtwo(systemImageName:"Angrry", systemImageName2: "Clam", 
                                        description:("وجه غاضب"), 
                                        description2:("وجه هادئ")
                            )
                            
                            OnboardViewthree(systemImageName:"Shy", systemImageName2: "Sleep", 
                                        description:("وجه خجول"), 
                                        description2:("وجه نعسان") 
                            )
                            
                            OnboardViewfour(systemImageName:"Sick", systemImageName2: "Excited ", 
                                        description:("وجه مريض"), 
                                        description2:("وجه متحمس")
                                        
                            )
                        
                        
                        OnboardViewlast(systemImageName:"suprised", systemImageName2: "Scared", 
                                     description:("وجه متفاجئ"), 
                                     description2:("وجه خائف")
                                     
                        )
                        
                        } .tabViewStyle(.page(indexDisplayMode: .always))
                        
                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                            
                    }
                    
        }.navigationViewStyle(StackNavigationViewStyle())
        
            .onAppear(perform: {
                //MARK: عند تحميل الواجهه استدعي التابع 
                Sound.instance.soundemo()
            })
        
        }

                    
    struct OnboardView: View {
        
        
        
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
                                    Sound.instance.SadSound()
                                } )
                                {
                                    Image(systemName: ("speaker.2.fill"))
                                    //speaker icon
                                        .resizable(resizingMode: .stretch)
                                        .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                        .frame(width: 25, height: 25)
                                }
                                // Spacer()
                                //     .frame(width: 50.0, height: 200.0
                                
                                
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
                                    Sound.instance.HappySound()
                                } )
                                {
                                    Image(systemName: ("speaker.2.fill"))
                                    //speaker icon
                                        .resizable(resizingMode: .stretch)
                                        .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                        .frame(width: 25, height: 25)
                                }
                                // Spacer()
                                //     .frame(width: 50.0, height: 200.0
                            }
                            
                        }
                        
                        Spacer()
                            .frame(width: 50.0, height: 80.0)
                        
                        
                        
                        
                        
                        
                    }
                    
                }
            }
            
            
        }
    }
    
    
    
}
struct OnboardViewlast: View {
    
    
    
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
                            Sound.instance.playSound2()
                        } )
                        {
                        Image(systemName: ("speaker.2.fill"))
                        //speaker icon
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .frame(width: 25, height: 25)
                            }
                        // Spacer()
                        //     .frame(width: 50.0, height: 200.0
                        
                        
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
                            Sound.instance.scaredSound()
                        } )
                        {
                        Image(systemName: ("speaker.2.fill"))
                        //speaker icon
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                            .frame(width: 25, height: 25)
                            }
                        // Spacer()
                        //     .frame(width: 50.0, height: 200.0
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
                    HStack{
                        Text("ابدأ التوصيل")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                        
                        //Text("\(mystate)")
                    }.frame(width: 200, height: 50, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color(red:84/255, green: 165/255,blue: 218/255)))
        
        }
    
}
    }

    
    }
}


struct OnboardViewthree: View {
    
    
    
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
                                Sound.instance.ShySound()
                            } )
                            {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                                }
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                            
                            
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
                                Sound.instance.sleepSound()
                            } )
                            {
                            Image(systemName: ("speaker.2.fill"))
                            //speaker icon
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                .frame(width: 25, height: 25)
                                }
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                        
                    }
                    
                    Spacer()
                        .frame(width: 50.0, height: 80.0)
                    
                    
                    
                
                
                    
                }
                
            }
        }
        
        
    }
}


struct OnboardViewfour: View {
    
    
    
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
                                Sound.instance.sickSound()
                            } )
                            {
                                Image(systemName: ("speaker.2.fill"))
                                //speaker icon
                                    .resizable(resizingMode: .stretch)
                                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                    .frame(width: 25, height: 25)
                            }
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                            
                            
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
                                Sound.instance.excitedSound()
                            } )
                            {
                                Image(systemName: ("speaker.2.fill"))
                                //speaker icon
                                    .resizable(resizingMode: .stretch)
                                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                    .frame(width: 25, height: 25)
                            }
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                        
                    }
                    
                    Spacer()
                        .frame(width: 50.0, height: 80.0)
                    
                    
                    
                    
                    
                    
                }
                
            }
        }
        
        
    }
}



struct OnboardViewtwo: View {
    
    
    
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
                                Sound.instance.AngrySound()
                            } )
                            {
                                Image(systemName: ("speaker.2.fill"))
                                //speaker icon
                                    .resizable(resizingMode: .stretch)
                                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                    .frame(width: 25, height: 25)
                            }
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                            
                            
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
                                Sound.instance.clamSound()
                            } )
                            {
                                Image(systemName: ("speaker.2.fill"))
                                //speaker icon
                                    .resizable(resizingMode: .stretch)
                                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                                    .frame(width: 25, height: 25)
                            }
                            // Spacer()
                            //     .frame(width: 50.0, height: 200.0
                        }
                        
                    }
                    
                    Spacer()
                        .frame(width: 50.0, height: 80.0)
                    
                    
                    
                    
                    
                    
                }
                
            }
        }
        
        
    }
}



