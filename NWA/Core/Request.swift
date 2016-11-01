//
//  Request.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/19/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import Alamofire
import CryptoSwift
import RealmSwift
import SwiftyJSON


enum CallType {

    case Marvel
    case GOT
}

struct ApiUrls {
    
    static let publicKey    = "786186b3b86214be83fcb290baf1d3b3"
    static let privateKey   = "0d2421fc2d74beb41b571ee4e980e49817e628a7"
    static let timeStamp    = UInt64(NSDate().timeIntervalSince1970 * 1000.0).description
    static let hash         = "\(timeStamp)\(privateKey)\(publicKey)".md5()

    
    static let serverApi    = "http://gateway.marvel.com/"
    static let publicComics = "v1/public/comics"
    
    static let publicGOT    = "https://api.myjson.com/bins/12y56"
    
}

struct Request {

    static func requestAPI(callType: CallType,
                           successBlock : @escaping ((AnyObject?) -> ()),
                           failureBlock : (String?) -> ()){

        if Reachability.isConnectedToNetwork() {
            
            let urlString : URLConvertible = getServerURL(callType: callType)
            
            Alamofire.request(urlString, method: .get)
                .responseJSON{ response in
            
                    let data = response.result
                    
                    switch data{
                        
                    case .success:
//                        print("printa \(data.value)")
                        
                        let json = JSON(data.value)
//                        print(json["persons"])
                        
                        for person in json["persons"]{
                            
//                            print(person.1["house"])
                            
                            let eachPerson = GOTModel()
                            
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
                        
                        
                        break
                    case .failure(let error):
                        print(error)
                        break
                        
                    }
                    
                    
            
            }
            
            
        }else{
            failureBlock("Sem Internet")
        }
    }
    
    static func getServerURL(callType: CallType) -> String{
        
        switch callType {
        case .Marvel:
            return (ApiUrls.serverApi) + (ApiUrls.publicComics)
        case .GOT:
            return (ApiUrls.publicGOT)
        }
        
        
    }
    
}
