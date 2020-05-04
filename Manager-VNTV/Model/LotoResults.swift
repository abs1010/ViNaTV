//
//  LotoResults.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 02/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

enum lotteryTypes : String {
    
    case lotofacil = "Lotofacil"
    case mega_sena = "Mega-Sena"
    case quina = "Quina"
    case dupla_sena = "Dupla-Sena"
    case lotomania = "Lotomania"
    case timenania = "Time-Mania"
    case dia_de_sorte = "Dia de Sorte"
    
}

struct LotoResults: Codable {
    let code: Int?
    let status: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let drawNumber: Int?
    let drawDate: String?
    let drawing: Drawing?
    let prizes: [Prize]?
    let cities: [City]?
    let hasWinner: Bool?
    let nextDrawDate: String?
    let nextDrawPrize: Int?

    enum CodingKeys: String, CodingKey {
        case drawNumber = "draw_number"
        case drawDate = "draw_date"
        case drawing, prizes, cities
        case hasWinner = "has_winner"
        case nextDrawDate = "next_draw_date"
        case nextDrawPrize = "next_draw_prize"
    }
}

// MARK: - Drawing
struct Drawing: Codable {
    let draw: [Int]?
}

// MARK: - Prize
struct Prize: Codable {
    let name: String?
    let winners: Int?
    let prize: Double?
}

struct City: Codable {
    let city: String?
    let state: String?
}
