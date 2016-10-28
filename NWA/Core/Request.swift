//
//  Request.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/19/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import Alamofire
import CryptoSwift
import AlamofireObjectMapper


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

            
//            Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default)
//                .validate()
//                .responseObject{(URLResponse:(DataResponse<GOTModel>) in
//            
//
//            }
            
            Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseObject{(response: DataResponse<GOTModel>) in
                
                let gotPersons = response.result.value
                
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
