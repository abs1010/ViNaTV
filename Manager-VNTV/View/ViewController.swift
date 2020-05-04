//
//  ViewController.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 02/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var animatedLottieView: AnimationView!
    
    var provider: APIManager?
    
    var results: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        provider = APIManager(lotteryType: .mega_sena)
        
        provider?.delegate = self
        
    }
    
    @IBAction func updateResults(_ sender: UIButton) {
        
        startAnimation()
        
        provider?.getResults()
        
    }
    
    
    func startAnimation() {
        
        let name = "4510-uploading"
        let animation = Animation.named(name)
        animatedLottieView.animation = animation
        animatedLottieView.loopMode = .loop
        animatedLottieView.play()
        
    }
    
    func stopAnimation() {
        self.animatedLottieView.stop()
        self.animatedLottieView.animation = nil
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "goToResults" {
//            
//            if let vc: ResultsViewController = storyboard?.instantiateViewController(identifier: "ResultsViewController") {
//                
//                vc.results = self.results
//                
//            }
//            
//        }
//        
//    }
    
}

extension ViewController : APIManagerDelegate {
    
    func successOnGettingResults(model: LotoResults) {
        
        DispatchQueue.main.async {
            
            self.stopAnimation()
            
            if let results = model.data?.drawing?.draw {
                self.results = results
            }
             
            if let vc: ResultsViewController = self.storyboard?.instantiateViewController(identifier: "ResultsViewController") {
                
                vc.results = self.results
                
                self.present(vc, animated: true)
                
            }
            
            //self.performSegue(withIdentifier: "goToResults", sender: nil)
            
        }
    }
    
    func error(_ error: APIError) {
        
        DispatchQueue.main.async {
            
            print("ERRO \(error)")
            
        }
        
    }
    
}

