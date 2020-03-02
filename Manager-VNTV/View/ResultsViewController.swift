//
//  ResultsViewController.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 02/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    
    var results: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        
        self.resultsCollectionView.register(UINib(nibName: "ResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ResultsCellID")
        
    }
    
    func setupView(){
        
        self.resultsCollectionView.delegate = self
        self.resultsCollectionView.dataSource = self
        

        
    }
    
    
    @IBAction func closeWindow(_ sender: UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    
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

extension ResultsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.results.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultsCellID", for: indexPath) as! ResultsCollectionViewCell
        
        cell.setupView(singleNumber: self.results[indexPath.item])
        
        return cell
        
    }
    
    
}
