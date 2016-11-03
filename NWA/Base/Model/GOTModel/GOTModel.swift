//
//  GOTModel.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/27/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class GOTModel: Object{
    
    dynamic var id = ""
    dynamic var name = ""
    dynamic var origin = ""
    dynamic var house = ""
    dynamic var title = ""
    dynamic var image = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    class func persistOrUpdateJsonFromService(json: JSON) -> Void{
        
        for person in json["persons"]{
            
            let eachPerson = GOTModel()
            
            eachPerson.id = person.1["id"].string!
            eachPerson.house = person.1["house"].string!
            eachPerson.name = person.1["name"].string!
            eachPerson.image = person.1["image"].string!
            eachPerson.title = person.1["title"].string!
            eachPerson.origin = person.1["origin"].string!
            
            let realm = try! Realm()
            
            try! realm.write {
                
                realm.add(eachPerson, update: true)
            }
        }
    }
    
    class func getAllObjects() -> NSObject{
        
        let realm = try! Realm()
    
        return realm.objects(GOTModel.self)
    }
    
    class func getCountOfAllObjects() -> NSInteger{
        
        let realm = try! Realm()
        
        return realm.objects(GOTModel.self).count
    }
    
    class func deleteObjectByPrimaryKey(primaryKey: String) -> Void{
        
        let realm = try! Realm()
        
        let each = realm.object(ofType: GOTModel.self, forPrimaryKey: primaryKey)
        if (each != nil){
            
            try! realm.write {
                
                realm.delete(each!)
            }
        }
    }
    
}
