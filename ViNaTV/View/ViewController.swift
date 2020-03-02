//
//  ViewController.swift
//  ViNaTV
//
//  Created by Alan Silva on 27/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additionalsetup after loading the view.
        
        LoginController.login.signInWithFirebase(email: "abs10@globomail.com", passwd: "a1s42d5") { (loginResponse) in
            
            if loginResponse {
                print("OKiDoki")
            }
            else {
                print("Erro")
            }
            
        }
        
    }


}

