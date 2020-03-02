//
//  ViewController.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 02/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import Lottie

class ViewController: BaseViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var animatedLottieView: AnimationView!
    
    var refreshControl: UIRefreshControl?
    
    var counter = 0
    var timer: Timer!
    
    var provider: APIManager?
    
    var results: [LotoResults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addRefreshingControl()
        
        provider = APIManager(lotteryType: lotteryTypes[counter].code)
        
        provider?.getResults()
        
        setupView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        timer.invalidate()
        
    }
    
    func setupView(){
        
        let nibName = "MainTableViewCell"
        let cellIdentifier = "MainCell"
        
        resultsTableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        self.resultsTableView.delegate = self
        self.resultsTableView.dataSource = self
        self.provider?.delegate = self
        removeBlurEffect()
        
    }
    
    func setBlurEffect(){
        
        UIView.animate(withDuration: 0.5) {
            
            self.frontView.isHidden = false
            self.alertView.isHidden = false
            self.animatedLottieView.isHidden = false
            self.frontView.backgroundColor = .black
            self.frontView.alpha = 0.6
            
            
            self.animatedLottieView.backgroundColor = .white
            self.alertView.backgroundColor = .white
            self.alertView.layer.cornerRadius = 8.0
            
        }
        
    }
    
    func removeBlurEffect(){
        
        self.frontView.isHidden = true
        self.alertView.isHidden = true
        self.animatedLottieView.isHidden = true
        self.animatedLottieView.backgroundColor = .clear
        self.alertView.backgroundColor = .clear
        self.frontView.backgroundColor = .clear
        
        
    }
    
    func addRefreshingControl(){
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.tintColor = #colorLiteral(red: 0, green: 0.5904152989, blue: 0.9216986299, alpha: 1)
        self.refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        self.resultsTableView.addSubview(refreshControl!)
        
        
    }
    
    @objc func refreshList() {
        
        self.refreshControl?.endRefreshing()
        
        setBlurEffect()
        startAnimation(self.animatedLottieView)
        
        timer = Timer.scheduledTimer(timeInterval: 12.0, target: self, selector: #selector(fireProcess), userInfo: nil, repeats: true)
        
    }
    
    
//    @IBAction func updateResults(_ sender: UIButton) {
//
//        setBlurEffect()
//        startAnimation(self.animatedLottieView)
//
//        //fireProcess()
//        timer = Timer.scheduledTimer(timeInterval: 12.0, target: self, selector: #selector(fireProcess), userInfo: nil, repeats: true)
//
//    }
    
    @objc private  func fireProcess(){
        
        let cycles = lotteryTypes.count
        
        counter += 1
        
        if counter < cycles {
            print(lotteryTypes[counter].code)
            
            if counter > 0 {
                provider = APIManager(lotteryType: lotteryTypes[counter].code)
            }
            
            provider?.delegate = self
            
            provider?.getResults()
            
            
        }else {
            
            timer.invalidate()
            stopAnimation(self.animatedLottieView)
            removeBlurEffect()
            
        }
        
        ////        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
        ////
        ////            //Fires again to STOP
        ////            self.timer.invalidate()
        ////
        ////        }
        
    }
    
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return results.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        cell.brand = lotteryTypes[indexPath.row].code
        cell.result = results[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}

extension ViewController : APIManagerDelegate {
    
    func successOnGettingResults(model: LotoResults) {
        
        DispatchQueue.main.async {
            
            self.results.append(model)
            
            self.resultsTableView.reloadData()
            
        }
    }
    
    func error(_ error: APIError) {
        
        DispatchQueue.main.async {
            
            print("ERRO \(error)")
            
        }
        
    }
    
}




//            if let vc: ResultsViewController = self.storyboard?.instantiateViewController(identifier: "ResultsViewController") {
//
//                //vc.results = self.results
//
//                self.present(vc, animated: true)
//
//            }
