//
//  BoyViews.swift
//  face
//
//

import SwiftUI
import Foundation

struct GirlViews: View {
    
    @EnvironmentObject var env : Environment1
    @Binding var shouldPopToRootView : Bool
    @State var size : CGFloat = (UIScreen.main.bounds.size.height * 0.2)
    
    var body: some View {
        
        switch env.num {
            case 1:
                return AnyView(face1gView(shouldPopToRootView: self.$shouldPopToRootView))
            case 2:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 3:
                return AnyView(face2gView(shouldPopToRootView: self.$shouldPopToRootView))
            case 4:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 5:
                return AnyView(face3gView(shouldPopToRootView: self.$shouldPopToRootView))
            case 6:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 7:
                return AnyView(face4gView(shouldPopToRootView: self.$shouldPopToRootView))
            case 8:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 9:
                return AnyView(face5gView(shouldPopToRootView: self.$shouldPopToRootView))
            case 10:
                return AnyView(MassegeView(shouldPopToRootView: self.$shouldPopToRootView))
            case 11:
                return AnyView(EndView())
                
            default:
                return AnyView(Text("End"))
            }
            

    }
  

}

//struct GirlViews_Previews: PreviewProvider {
//    static var previews: some View {
//        GirlViews()
//    }
//}

