//
//  firstLearnView.swift
//  HoldMyHand
//
//  Created by loka mloka on 19/08/1443 AH.
//

import SwiftUI

//struct firstLearnView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct firstLearnView_Previews: PreviewProvider {
//    static var previews: some View {
//        firstLearnView()
//    }
//}

struct firstLearnView: View {
    var body: some View {
     /*  TabView{
            firstLearnView()
    .previewInterfaceOrientation(.landscapeLeft)
            
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))*/
        VStack{
            HStack{
               // Image(systemName: "house.fill")//home icon
               //     .resizable(resizingMode:.stretch)
              //      .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
               //     .frame(width: 100.0, height: 95)
                
                Image(systemName: "speaker.fill")//speaker icon
                    .resizable(resizingMode:.stretch)
                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                    .frame(width: 60.0, height: 65)
                
                Spacer()
                    .frame(width: 880, height: 10.0)
                
                NavigationLink(destination: Home(), label: {
                Image(systemName: "house.fill")//home icon
                    .resizable(resizingMode:.stretch)
                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                    .frame(width: 90.0, height: 85)
                })
              //  Image(systemName: "speaker.fill")//speaker icon
                //    .resizable(resizingMode:.stretch)
               //     .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                 //   .frame(width: 100.0, height: 95)

            }
            
    VStack{
        
        HStack{
            Text("لنتعلم الأوجه التعبيرية")//title text
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
        }
        
        Spacer()
            .frame(width: 100.0, height: 100)


    HStack{
        
        VStack{//image and text
            Image("sad")
                .resizable()
                .frame(width: 350, height: 350)
            
                
            Text("وجه حزين")
                .font(.largeTitle)
              //  .frame(width: 50, height: 50)
                .fontWeight(.bold)
                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                .multilineTextAlignment(.trailing)
                .lineLimit(13)
            
           // Spacer()
           //     .frame(width: 50.0, height: 200.0)
        }
        
            Spacer()
                .frame(width: 200.0, height: 200.0)
            

        VStack{//same as above
            Image("happy")
                .resizable()
                .frame(width: 350, height: 350)//150.0

            
            Text("وجه سعيد") .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                .multilineTextAlignment(.trailing)
                .lineLimit(12)
            
         //   Spacer()
           //     .frame(width: 50.0, height: 200.0)
        }
          
    }
        Spacer()
            .frame(width: 50.0, height: 80.0)
    }
        }
        
    }
}

struct firstLearnView_Previews: PreviewProvider {
    static var previews: some View {
        firstLearnView()
            .rotationEffect(.init(degrees: 90.0))
//.previewInterfaceOrientation(.landscapeLeft)
    }
}
