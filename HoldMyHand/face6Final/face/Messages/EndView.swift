//
//  EndView.swift
//  face
//
//  Created by Smart Tracks on 16/04/2022.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var env : Environment1
    
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
        Button {
            env.num = 1
            activityStatus.Status.resetLevels()
        } label: {
            Image(systemName: "gobackward")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)

    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
//.previewInterfaceOrientation(.landscapeLeft)
    }
}
