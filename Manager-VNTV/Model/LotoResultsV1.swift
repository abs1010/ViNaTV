////
////  LotoResultsV1.swift
////  Manager-VNTV
////
////  Created by Alan Silva on 07/05/20.
////  Copyright © 2020 Alan Silva. All rights reserved.
////
//
//import Foundation
//
//struct LotoResultsV1: Codable {
//    let code: Int?
//    let status: String?
//    let data: DataClass?
//}
//
//// MARK: - DataClass
//struct DataClassV1: Codable {
//    let drawNumber: Int?
//    let drawDate: String?
//    let drawing: DrawingV1?
//    let prizes: Prizes?
//    let cities: [City]?
//    let hasWinner: Bool?
//    let nextDrawDate: String?
//    let nextDrawPrize: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case drawNumber = "draw_number"
//        case drawDate = "draw_date"
//        case drawing, prizes, cities
//        case hasWinner = "has_winner"
//        case nextDrawDate = "next_draw_date"
//        case nextDrawPrize = "next_draw_prize"
//    }
//}
//
//// MARK: - Drawing
//struct DrawingV1: Codable {
//    let firstDraw, secondDraw: [Int]?
//
//    enum CodingKeys: String, CodingKey {
//        case firstDraw = "first_draw"
//        case secondDraw = "second_draw"
//    }
//}
//
//// MARK: - Prizes
//struct Prizes: Codable {
//    let firstDraw, secondDraw: [Draw]?
//
//    enum CodingKeys: String, CodingKey {
//        case firstDraw = "first_draw"
//        case secondDraw = "second_draw"
//    }
//}
//
//// MARK: - Draw
//struct Draw: Codable {
//    let name: String?
//    let winners: Int?
//    let prize: Double?
//}
