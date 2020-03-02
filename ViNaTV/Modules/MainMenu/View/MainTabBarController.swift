//
//  MainTabBarController.swift
//  ViNaTV
//
//  Created by Alan Silva on 21/04/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var email : String?
    var lottery: LotteryViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if isLoggedIn(){
            lottery = LotteryViewController()
//        } else {
//            perform(#selector(showLoginViewController), with: nil, afterDelay: 0.01)
//        }
    }

    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.getLoggedInState()
    }
    
    @objc func showLoginViewController(){
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        guard let vc: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginStoryboard") as? LoginViewController else {return}
        self.present(vc, animated: true, completion: nil)
    }

}
