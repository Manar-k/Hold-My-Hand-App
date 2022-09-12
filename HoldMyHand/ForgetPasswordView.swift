//
//  ForgetPasswordView.swift
//  HoldMyHand
//
//  Created by loka mloka on 02/08/1443 AH.
//

import SwiftUI
import Firebase

struct ForgetPasswordView: View {
    //user email
    @State private var email:String = ""
    //to show the alert window
    @State private var alertWindow = false
    //to write the error message
    @State  var errorText :String = ""
    
    //The style of BACKBUTTON  by changing the written text to Arabic and changing the image of BACKBUTTON.
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var backButton : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName:"chevron.left") // BackButton Image
                    Text("العودة") //translated Back button title
                }
            }
        }
    
    var body: some View {
        VStack(alignment:.trailing ){
            //Image of logo
            Image("لوقو اصلي 1")
                .resizable()
                .frame(width:400,height:300)
            
            Spacer()
                .frame(width:400,height:60)
            
                //Text of reset password
                Text("هل نسيت كلمة المرور؟")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
                    .multilineTextAlignment(.trailing)
                
                //a description text
                Text("سيتم إرسال رابط إعادة تعيين كلمة المرور إلى عنوان بريدك الالكتروني المسجل.")
                    .font(.title2)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 390, height: 100)
            
                //label and textfield
                InputTextField(stateBinding: $email,label: "البريد الالكتروني",placeholder:"البريد الالكتروني", secureTextFileld:false)
            
            Spacer()
                .frame(width: 10, height: 30)
            
            //Button of send link to change user password
            HStack(alignment:.center){
                Button (action:{
                    //if field empty show the alert window
                    if email.isEmpty {
                        self.alertWindow = true
                        self.errorText = "يرجى ملء الحقل "
                    }
                    //calling restPassword function
                    else{
                        resetPassword()
                    }
                })
                {
                    HStack{
                    Text("ارسل الرابط")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        
                }.frame(width: 400, height: 50, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(red:84/255, green: 165/255,blue: 218/255)))
                    .alert(isPresented: $alertWindow, content: {//content of the alert window
                        Alert(title: Text("تنبيه"), message:Text(errorText),dismissButton: .default(Text("موافق")))
                    })
                }

            }.padding(.horizontal)
            .background(Color.white)
            .ignoresSafeArea(edges: [.top,.bottom])
            
        } .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    //This function is to change user password by sending a link to a user email and showing an alert window for different cases.
func resetPassword(){
    Auth.auth().languageCode = "ar"//change the content of sent message from English to Arabic
    
    Auth.auth().sendPasswordReset(withEmail: email) { (error) in
        if let error = error as NSError? {
        switch AuthErrorCode(rawValue: error.code) {
        case .userNotFound:
            self.alertWindow = true
            self.errorText = "يتعذر الحصول على البريد الالكتروني المدخل"
            break
            
        case .invalidEmail:
            self.alertWindow = true
            self.errorText = "البريد الالكتروني مدخل بطريقة خاطئة"
            break
            
        case .invalidRecipientEmail:
            self.alertWindow = true
            self.errorText = "تم إرسال بريد إلكتروني غير صالح للمستلم في الطلب"
            break
            
        case .invalidSender:
            self.alertWindow = true
            self.errorText = "تم تعيين بريد إلكتروني غير صالح في وحدة التحكم لهذا الإجراء"
            break
            
        case .invalidMessagePayload:
            self.alertWindow = true
            self.errorText = "قالب بريد إلكتروني غير صالح لإرسال بريد إلكتروني للتحديث"
            break
        default:
          print("Error message: \(error.localizedDescription)")
        }
      } else {
        self.alertWindow = true
        self.errorText = "تم إرسال رابط إعادة تعيين كلمة المرور بنجاح"
        print("success")
      }
    }
}
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
            ForgetPasswordView()
    }
}
