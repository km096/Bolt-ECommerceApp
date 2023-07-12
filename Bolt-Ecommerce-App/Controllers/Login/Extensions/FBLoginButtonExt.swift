////
////  FBLoginButtonExt.swift
////  Bolt-Ecommerce-App
////
////  Created by ME-MAC on 7/8/23.
////
//
//import UIKit
//import FBSDKLoginKit
//import FirebaseAuth
//
//extension LoginVC : LoginButtonDelegate {

//private func setupLoginButton() {
//    if let token = AccessToken.current,
//            !token.isExpired {
//        let token = token.tokenString
//
//        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
//        
//        print("Login success!")
//        
//        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
//            // User is logged in, do work such as go to next view controller.
//    } else {
//        FBLoginButton.delegate = self
//        FBLoginButton.permissions = ["public_profile", "email"]
//    }
//
//}
//    
//    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
//        
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        } else {
//            let token = result?.token?.tokenString
//
//            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
//            
//            print("Login success!")
//            
//            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
//            
//            request.start { connecting, result, error in
//                print("\(result)")
//            }
//            
//        }
//        
//    }
//    
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
//        print("Logged out")
//    }
//}
//
