//
//  UserSettingsViewController.swift
//  ViNaTV
//
//  Created by Alan Silva on 23/04/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import Lottie

class UserSettingsViewController: UIViewController {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var textDescriptionLabel: UILabel!
    @IBOutlet weak var animatedLottieView: AnimationView!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    func setupView(){
        
        textDescriptionLabel.text = "Entre agora!\n e desfrute de todas as funções"
        startAnimation()
        
        signInButton.layer.cornerRadius = 4.0
        
    }
    
    
    @IBAction func tappedSignIn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        
        let loginVC = storyboard.instantiateViewController(identifier: "LoginStoryboard")
        
        self.present(loginVC, animated: true)
        
    }
    
    func hideElementsWhenLogged(){
        
        //if logged {}
        textDescriptionLabel.isHidden = true
        animatedLottieView.isHidden = true
        signInButton.isHidden = true
        stopAnimation()
        
    }
    
    
    func startAnimation() {
        
        let name = "18943-growth"
        let animation = Animation.named(name)
        animatedLottieView.animation = animation
        animatedLottieView.loopMode = .loop
        animatedLottieView.play()
        
    }
    
    func stopAnimation() {
        self.animatedLottieView.stop()
        self.animatedLottieView.animation = nil
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
