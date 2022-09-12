//
//  CreateAccountView.swift
//  HoldMyHand
//
//  Created by loka mloka on 02/08/1443 AH.
//

import SwiftUI
import Firebase

struct CreateAccountView: View {
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

    @State private var alertWindow = false //to show the alert window
    @State  var errorText :String = "" //to write the error message
    
    @State  var name:String = "" //user name
    @State  var email:String = "" //user email
    @State  var password:String = "" //user password
    @State var selectionGender:String = "male" //user gender
    
    //The style of select gender, change color and size
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.init(Color(red:84/255, green: 165/255,blue: 218/255, opacity: 1.0))
        UISegmentedControl.appearance().setTitleTextAttributes(
                    [
                        .font: UIFont.boldSystemFont(ofSize: 28),
                        .foregroundColor: UIColor.white
                ], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(
                    [
                        .font: UIFont.systemFont(ofSize: 28),
                        .foregroundColor: UIColor.gray
                ], for: .normal)
    }
    
    
    var body: some View {
        //create account
        VStack(alignment: .center, spacing:30){
            
            //Image of logo
            Image("لوقو اصلي 1")
                .resizable()
                .frame(width:400,height:300)
            
            //Text of create account
            Text("إنشاء الحساب")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red:84/255, green: 165/255,blue: 218/255))
            
            //labels and textfield
            InputTextField(stateBinding: $name,label: "الاسم",placeholder:"  الاسم  ", secureTextFileld:false)
            InputTextField(stateBinding: $email,label: "البريد الالكتروني",placeholder:"  البريد الالكتروني  ", secureTextFileld:false)
            InputTextField(stateBinding: $password,label: "كلمة المرور",placeholder:"  كلمة المرور  ", secureTextFileld:true)
            
            //select gender
            VStack{
                Picker(selection: $selectionGender, label:
                       Text("gender")
                ) {
                    Text("ذكر ").tag("male")
                    Text("انثى").tag("female")
                    
                }
                .frame(width: 480, height: 60)
                .pickerStyle(SegmentedPickerStyle())
                .scaledToFit()
                .scaleEffect(CGSize(width: 0.86, height: 1.4))
                
            }

            //create account button
            Button (action:{
                if email.isEmpty || password.isEmpty || name.isEmpty { //if one of the fields empty show the alert window
                    self.alertWindow = true
                    self.errorText = "يرجى ملء الحقول "
                }
                //if password not strong show the alert window
                else if !isValidPassword(password){
                    self.alertWindow = true
                    self.errorText = "يجب أن تكون كلمة المرور من ٨ أحرف بحد أدنى وأن تحتوي على أحرف كبيرة وصغيرة وارقام وأحرف خاصة"
                }
                // calling create account function
                else{
                    createAccount()
                }
            })
            {
                HStack{
                Text("إنشاء")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    
            }.frame(width: 400, height: 50, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color(red:84/255, green: 165/255,blue: 218/255)))
                .alert(isPresented: $alertWindow, content: { //content of the alert window
                    Alert(title: Text("تنبيه"), message:Text(errorText),dismissButton: .default(Text("موافق")))
                })
            }
            
        }.padding(.horizontal)
        .background(Color.white)
        .ignoresSafeArea(edges: [.top,.bottom])
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)

    }
    //This function is to create a new user account and show an alert window for different cases.
    func createAccount(){
        Auth.auth().createUser(withEmail: email, password: password)
        {(authResult,error) in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code){
                case .operationNotAllowed :
                    self.alertWindow = true
                    self.errorText = "لم تتم العملية، هناك خطأ ما"
                    break
                
                case .emailAlreadyInUse :
                    self.alertWindow = true
                    self.errorText = "البريد الالكتروني مستخدم بالفعل"
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
                self.alertWindow = true
                self.errorText = "تم انشاء الحساب بنجاح"
                print("Success")
                
                //store user data to database
                let userID = Auth.auth().currentUser?.uid
                let ref = Database.database().reference()
                ref.child("User").child(userID ?? " ").setValue(["UserID":userID,"Name":name,"Gender": selectionGender])
            }
        }
    }
    //This function is to check the strength of the user password by it contain:
    func isValidPassword(_ teststr :String?)-> Bool{
        // at least one uppercase,
        // at least one digit
        // at least one one special case letter
        // at least one lowercase
        // 8 characters total
        guard teststr != nil else {return false}
        let passtest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[a-z]).{8,}")
        return passtest.evaluate(with: teststr)
}
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
//"Email":email , "password": Password,
