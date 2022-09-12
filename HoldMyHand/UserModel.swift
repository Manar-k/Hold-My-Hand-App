//
//  UserModel.swift
//  HoldMyHand
//
//  Created by loka mloka on 02/08/1443 AH.
//

import Foundation

public class Users :ObservableObject{
    var name = "", email = "", password = "", gender :String = ""
    @Published var User_ID:Int = 1

//    init(name : String , email : String , password : String ,gender : String, User_ID :Int ) {
//        self.name = name
//        self.email = email
//        self.password = password
//        self.gender = gender
//        self.User_ID = User_ID
//    }
    
    //getter and setter of name
    func getName() -> String {
        return name
    }
    
    func setName(name:String){
        self.name=name
    }
    
    //getter and setter of email
    func getEmail() -> String {
        return email
    }
    
    func setEmail(email:String){
        self.email=email
    }
    
    //getter and setter of password
    func getPassword() -> String {
        return password
    }
    
    func setPassword(password:String){
        self.password=password
    }
    
    //getter and setter of gender
    func getGender() -> String {
        return gender
    }
    
    func setGender(gender:String){
        self.gender=gender
    }
    
    //getter and setter of user id
    func getUser_ID() -> Int {
        return User_ID
    }
    
    func setUser_ID(User_ID:Int){
        self.User_ID=User_ID
    }
}
