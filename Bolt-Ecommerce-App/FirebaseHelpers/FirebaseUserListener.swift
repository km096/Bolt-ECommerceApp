//
//  FirebaseUserListener.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class  FirebaseUserListener {
    
    static let shared = FirebaseUserListener()
    
    private init() {}
    
    //MARK: - Login
    func loginUserWithEmail(email: String, password: String, completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if error == nil && authResult!.user.isEmailVerified {
                self.downloadUserFromFirebase(userId: authResult!.user.uid)
                completion(error, true)
            } else {
                print("Email isn't verified")
                completion(error, false)
            }
        }
    }
    
    //MARK: - Register
    func registerWithEmail(username: String, email: String, password: String, competion: @escaping (_ error: Error?) -> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            competion(error)
            if error == nil {
            //send email verifacation
                authResult?.user.sendEmailVerification(completion: { error in
                    print("Auth email sent with error: \(error?.localizedDescription)")
                })
                
            }
            
            if authResult?.user != nil {
                let user = User(id: authResult!.user.uid, username: username, email: email)
                self.saveUserToFirebase(user)
            }
        }
    }
    
    //MARK: - Logout
    
    
    
    
    
    //MARK: - Resend link methods
    func resendEmailVerifacation(completion: @escaping (_ error: Error?) -> ()) {
        
        Auth.auth().currentUser?.reload(completion: { error in
            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                
                completion(error)
            })
        })
    }
    
    func resetPassword(email: String, completion: @escaping (_ error: Error?) -> ()) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    
    //MARK: - Save user
    func saveUserToFirebase(_ user: User) {
        do {
            try firebaseReferance(.user).document(user.id).setData(from: user)
        } catch {
            print("Error saving user to firestore: \(error.localizedDescription)")
        }
    }
    
    
    //MARK: - Downlpad User
    func downloadUserFromFirebase(userId: String) {
        firebaseReferance(.user).document(userId).getDocument { snapshot, error in
            
            guard let document = snapshot else {
                return
            }
            
            let result = Result {
                try? document.data(as: User.self)
            }
            
            switch result {
                
            case .success(let userObject):
                if let user = userObject {
                    self.saveUserToFirebase(user)
                    saveUserLocally(user)
                }
            case .failure(let error):
                print("Error Decoding user: \(error.localizedDescription)")
            }            
        }
    }
}
