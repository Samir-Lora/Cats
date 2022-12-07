//
//  CatsInfo.swift
//  Cats
//
//  Created by Samir on 6/12/22.
//

import Foundation

struct CatInfo: Codable {
    let url: String?
}

struct CatsInfo: Codable {
    var cats: [CatInfo?]
    
}
