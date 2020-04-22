//
//  LoginController.swift
//  ViNaTV
//
//  Created by Alan Silva on 29/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginController {
   
   static let login = LoginController()
    
   func signInWithFirebase(email: String, passwd: String, completion: @escaping(Bool) -> Void) {
        
    
        Auth.auth().signIn(withEmail: email, password: passwd) { (result, error) in
            
            if error != nil {
                completion(false)
                print("===Signing in error===")
            }
            else{
                completion(true)
                print("===The user \(email) is now logged===")
            }
            
        }
        
    }
    
}
