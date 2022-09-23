//
//  cardModel.swift
//  card-generator
//
//  Created by Mohamed Ali on 20/09/2022.
//

import Foundation

struct cardModel: Codable {
    var count: Int
    var data: [dataModel]
}

struct dataModel: Codable {
    var id: Int
    var name: String
    var age: String
    var code: String
}
