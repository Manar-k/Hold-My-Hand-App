//
//  ContentView.swift
//  HoldMyHand
//
//  Created by loka mloka on 20/07/1443 AH.
//

import SwiftUI
import Firebase

//to call "input text field()" whenever we need a text field in the interfaces, it contains a condition for specifying a normal and secure text field for password.
struct InputTextField: View {
    @Binding var stateBinding:String
    let label:String
    let placeholder:String
    let secureTextFileld:Bool

    var body: some View {
        VStack(alignment:.trailing ) {
            
            Text(label)
                .font(.largeTitle)
                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255, opacity: 1.0))
            
            //secure text field
            if secureTextFileld {
                SecureField(placeholder, text: $stateBinding)
                    .frame(width: 400, height: 45, alignment: .center)
                    .multilineTextAlignment(TextAlignment.trailing)
                    .padding(.horizontal,15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red:84/255, green: 165/255,blue: 218/255), lineWidth: 3))
            }
            else {
            TextField(placeholder, text: $stateBinding)
                .frame(width: 400, height: 45, alignment: .center)
                .multilineTextAlignment(TextAlignment.trailing)
                .padding(.horizontal,15)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red:84/255, green: 165/255,blue: 218/255), lineWidth: 3))
            }
        }
    }
}      

struct ContentView: View {
    @State private var alertWindow = false //to show the alert window
    @State var errorText :String = "" //to write the error message

    @State var email:String = "" //user email
    @State var password:String = "" //user password
    
    @EnvironmentObject var settings: userSetting
    
    //The style of BACKBUTTON  by changing the written text to Arabic and changing the image of BACKBUTTON.
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var backButton : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName:"chevron.left") // BackButton Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    Text("العودة") //translated Back button title
                }
            }
        }
    
    var body: some View {
        if settings.isLoggedIn {
            Home()
                .environmentObject(settings)
        }
        else{
        if UserDefaults.standard.bool(forKey: "login") == true {
            Home()
                .environmentObject(settings)
        }
        else{   
        //passing between interfaces
        NavigationView {
        VStack(alignment: .center, spacing:50){
            
            Spacer()
            
            //Image of logo
            Image("لوقو اصلي 1")
                .resizable()
                .frame(width:400,height:300)
            
            //Text of login
            Text("تسجيل الدخول")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
             
            //labels and textfield
            InputTextField(stateBinding: $email,label: "البريد الالكتروني",placeholder:"  البريد الالكتروني  ", secureTextFileld:false)
            InputTextField(stateBinding: $password,label: "كلمة المرور",placeholder:"  كلمة المرور  ", secureTextFileld:true)
            
            //login button
            Button (action:{
                //if one of the fields empty show the alert window
                if email.isEmpty || password.isEmpty {
                    self.alertWindow = true
                    self.errorText = "يرجى ملء الحقول "
                }
                // calling login function
                else {
                    login()
                }
            })
            {
                HStack{
                Text("دخول")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    
            }.frame(width: 400, height: 50, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color(red:84/255, green: 165/255,blue: 218/255)))
                .alert(isPresented: $alertWindow, content: { //content of the alert window
                    Alert(title: Text("تنبيه"), message:Text(errorText),dismissButton: .default(Text("موافق")))
                })
            }
            
            //other options to entering other interfaces
            HStack(alignment: .center){
                Spacer()
                //forget password interface
                VStack{
                    NavigationLink("نسيت كلمة المرور",destination: ForgetPasswordView())
                        .font(.title)
                        .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255, opacity: 1.0))
                Spacer()
                }
                
                VStack{
                    Rectangle()
                        .frame(width: 1, height: 70)
                    Spacer()
                    Spacer()
                }
                //create account interface
                VStack{
                    Text("ليس لديك حساب؟")
                        .font(.title)
                    NavigationLink("سجّل من هنا",destination: CreateAccountView())
                        .font(.title)
                        .foregroundColor(Color(red: 141/255, green: 208/255, blue: 235/255, opacity: 1.0))
                    Spacer()
                }
                Spacer()
            }
            
        }.padding(.horizontal)
        .background(Color.white)
        .ignoresSafeArea(edges: [.top,.bottom])

            
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)}}
    }
    //This function is for login to the app and shows an alert window for different cases.
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){(authResult,error) in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code){
                case .operationNotAllowed :
                    self.alertWindow = true
                    self.errorText = "لم تتم العميله، هناك خطأ ما"
                    break
                
                case .wrongPassword :
                    self.alertWindow = true
                    self.errorText = "البريد الالكتروني او كلمة المرور غير صحيحية"
                    break
                    
                case .invalidEmail:
                    self.alertWindow = true
                    self.errorText = "البريد الالكتروني مدخل بطريقة خاطئة"
                    break
                    
                default:
                    print("Error: \(error.localizedDescription)")
                }
            }
            else{
                print("Success")
                
                settings.isLoggedIn = true
                email = ""
                password = ""
                activityStatus.Status.resetLevels()
                
            }
        }
    }
    
//    func loggedIn(){
//        if Auth.auth().currentUser != nil {
//            Home()
//        }
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//                let user = Auth.auth().currentUser?.uid
//                let ref = Database.database().reference()
//                ref.child("User/\(user ?? " ")/password").setValue(password)

//                self.alertWindow = true
//                self.errorText = "تم تسجيل دخولك بنجاح"
