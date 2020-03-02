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
    @IBOutlet weak var ballView: UIView!
    
    var brand: String? {
        
        didSet {
            
            ballView.backgroundColor = setColor(brand ?? "")
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(singleNumber : Int){
        
        self.singleNumber.text = String(singleNumber)
        
        self.layer.cornerRadius = self.frame.size.height / 2
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
        
    }
    
    func setColor(_ str: String) -> UIColor {
        
        switch str {
            
        case "lotofacil":
            return .lotofacil
        case "mega_sena":
            return .megaSena
        case "quina":
            return .quina
        case "dupla_sena":
            return .duplaSena
        case "lotomania":
            return .lotomania
        case "timenania":
            return .timemania
        case "dia_de_sorte":
            return .diaDeSorte
            
        default:
            return .black
        }
        
    }
    
}
