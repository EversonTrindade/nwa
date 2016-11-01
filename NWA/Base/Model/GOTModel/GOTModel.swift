//
//  GOTModel.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/27/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import Foundation
import RealmSwift

class GOTModel: Object{
    
    dynamic var name = ""
    dynamic var origin = ""
    dynamic var house = ""
    dynamic var title = ""
    dynamic var image = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
