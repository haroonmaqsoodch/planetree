//
//  PlanetsModel.swift
//  Planetree
//
//  Created by Haroon Maqsood on 8/30/22.
//

import Foundation

struct PlanetsModel: Codable,Hashable, Identifiable {
    
    
    let basicDetails: [BasicDetail]
    let planetsDataModelDescription: String
    let id: Int
    let imgSrc: [ImgSrc]
    let key, name, planetOrder, source: String
    let wikiLink: String

    enum CodingKeys: String, CodingKey {
        case basicDetails
        case planetsDataModelDescription = "description"
        case id, imgSrc, key, name, planetOrder, source, wikiLink
    }
}

struct BasicDetail: Codable, Hashable {
    let mass, volume: String
}

struct ImgSrc: Codable, Hashable{
    let img: String
    let imgDescription: String
}

struct ImagesModel {
    var name: String
    var modelName: String
}
