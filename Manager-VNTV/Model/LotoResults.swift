//
//  LotoResults.swift
//  Manager-VNTV
//
//  Created by Alan Silva on 02/05/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

struct lotteryBrands {
    var code: String
    var name: String
}

/*let lotteryTypes: Set = ["lotofacil",
                         "mega_sena",
                         "quina",
                         "lotomania",
                         "dia_de_sorte",
                         "Dia de Sorte"]
*/
let lotteryTypes: [lotteryBrands] =
[lotteryBrands(code: "lotofacil",   name: "Lotofacil"),
lotteryBrands(code: "mega_sena",    name: "Mega-Sena"),
lotteryBrands(code: "quina",        name: "Quina"),
lotteryBrands(code: "lotomania",    name: "Lotomania"),
lotteryBrands(code: "dia_de_sorte", name: "Dia de Sorte")]

//lotteryBrands(code: "dupla_sena", name: "Dupla-Sena"),
//lotteryBrands(code: "timenania", name: "Time-Mania"),

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
    let month: String?
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
