//
//  APIManager.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 02/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation
import Firebase

protocol APIManagerDelegate : class {
    
    func successOnGettingResults(model: LotoResults)
    func error(_ error: APIError)
    
}

enum APIError: Error{
    case noDataAvailable
    case canNotProccessData
}

fileprivate let BASE_URL = "https://www.lotodicas.com.br/api/v2/"
fileprivate let API_KEY = "d0c10e634fa5f0a24549543fd1fd978d2cf16004d6fef15122032bff5b67608b"

class APIManager {
    
   weak var delegate: APIManagerDelegate?

    var lotteryType : String
    private let resourceURL:URL
    
    init(lotteryType : String) {
        
        self.lotteryType = lotteryType
    
        let url = "\(BASE_URL)\(lotteryType)/results/last?token=\(API_KEY)"
        
        guard let resourceURL = URL(string: url) else {fatalError()}
        
        self.resourceURL = resourceURL
        
    }
    
    func getResults(){
        
        URLSession.shared.dataTask(with: self.resourceURL) { data, response, error in
            
            guard let jsonData = data else {
                self.delegate?.error(.noDataAvailable)
                return
            }
            
            do{
                let modelResult = try JSONDecoder().decode(LotoResults.self, from: jsonData)
                self.delegate?.successOnGettingResults(model: modelResult)
                
                print("=====================")
                print("API Log")
                print("API Log - Resultados da \(self.lotteryType) obtivo com sucesso.")
        
                
            }catch{
                self.delegate?.error(.canNotProccessData)
                
                print("=====================")
                print("API Log")
                print("API Log -  ####Erro ao obter resultados da API. \(self.lotteryType)####")
            }
            
        }.resume()
        
    }
    
}
