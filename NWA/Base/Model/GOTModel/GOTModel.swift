//
//  GOTModel.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/27/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import Foundation
import ObjectMapper

class GOTModel: Mappable{

    var persons: [Persons]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
     
        persons <- map["persons"]
    }
}

class Persons: Mappable{
    
    var name:   String?
    var house:  String?
    var image:  String?
    var origin: String?
    var title:  String?
    
    required init?(map: Map) {
        
//        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        name    <- map["name"]
        house   <- map["house"]
        image   <- map["image"]
        origin  <- map["origin"]
        title   <- map["title"]
        
    }
}
