//
//  BaseViewController.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 04/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import Lottie

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func startAnimation(_ view: AnimationView) {
        
        //let name = "4510-uploading"
        let name = "19404-video-playback"
        let animation = Animation.named(name)
        view.animation = animation
        view.loopMode = .loop
        view.play()
        
    }
    
    func stopAnimation(_ view: AnimationView) {
        view.stop()
        view.animation = nil
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
