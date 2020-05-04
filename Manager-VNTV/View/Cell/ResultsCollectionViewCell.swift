//
//  ResultsCollectionViewCell.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 02/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class ResultsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var singleNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupView(singleNumber : Int){
        
        self.singleNumber.text = String(singleNumber)
        
        self.layer.cornerRadius = self.layer.frame.height / 2
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
        
    }
    
}
