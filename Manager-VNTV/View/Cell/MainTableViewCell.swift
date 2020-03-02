//
//  MainTableViewCell.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 04/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var drawNumber: UILabel!
    @IBOutlet weak var drawDate: UILabel!
    @IBOutlet weak var hasWinner: UILabel!
    @IBOutlet weak var prize: UILabel!
    @IBOutlet weak var resultsCollection: UICollectionView!
    
    var brand: String?
    var result: LotoResults? {
        
        didSet {
            
            self.brandImageView.image = UIImage(named: brand ?? "")
            self.drawNumber.text = "\(result?.data?.drawNumber ?? 0)"
            self.drawDate.text = formatData(result?.data?.drawDate ?? "")
            self.hasWinner.text = result?.data?.hasWinner == true ? "Sim" : "Não"
            self.hasWinner.textColor = result?.data?.hasWinner == true ? UIColor.systemGreen : UIColor.orange
            self.prize.text = formatNumberAsCurrency(result?.data?.nextDrawPrize ?? 0)
            
            resultsCollection.reloadData()
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.resultsCollection.register(UINib(nibName: "ResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ResultsCellID")
        
        self.resultsCollection.delegate = self
        self.resultsCollection.dataSource = self
        
    }
    
    
   private func formatNumberAsCurrency(_ from: Int) -> String {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.autoupdatingCurrent
        
        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        let priceString = currencyFormatter.string(from: NSNumber(value: from))!
        
        return priceString
        
    }
    
    
    private func formatData(_ string: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ssZ"
        let date = dateFormatter.date(from: string)!

        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd/MM/yyyy HH:mm"

        let drawDate = formatDate.string(from: date)
        
        return drawDate
        
    }
    
    
}

extension MainTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.result?.data?.drawing?.draw?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultsCellID", for: indexPath) as! ResultsCollectionViewCell
        
        if let index = self.result?.data?.drawing?.draw {
            
            cell.setupView(singleNumber: index[indexPath.item])
            cell.brand = self.brand ?? ""
            
        }
        
        return cell
        
    }
    
    
}
