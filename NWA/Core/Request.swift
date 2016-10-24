//
//  Request.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/19/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import Alamofire
import CryptoSwift

enum CallType {
    case PublicComics
}

struct ApiUrls {
    
    static let publicKey    = "786186b3b86214be83fcb290baf1d3b3"
    static let privateKey   = "0d2421fc2d74beb41b571ee4e980e49817e628a7"
    static let timeStamp    = UInt64(NSDate().timeIntervalSince1970 * 1000.0)
    static let hash         = "\(timeStamp)\(privateKey)\(publicKey)".md5()

    
    static let serverApi    = "http://gateway.marvel.com/"
    static let publicComics = "v1/public/comics"
    
}

struct Request {

    static func requestAPI(callType: CallType, successBlock : ((AnyObject?) -> ()), failureBlock : (String?) -> ()){
        
        let parameters: Parameters = [
            "apikey"    : ApiUrls.privateKey,
            "ts"        : ApiUrls.timeStamp,
            "hash"      : ApiUrls.hash
        ]
        
        print(parameters)
        
        if Reachability.isConnectedToNetwork() {
            
            Alamofire.request(getServerURL(callType: callType), method: HTTPMethod.get, parameters: parameters, encoding: JSONEncoding.default)
                .validate()
                .responseJSON{ response in
                    
                    if let JSON = response.result.value{
                        
                        print("JSON: \(JSON)")
                    }
            }
            
            
        }else{
            failureBlock("Sem Internet")
        }
    }
    
    static func getServerURL(callType: CallType) -> String{
        
        switch callType {
        case .PublicComics:
            return (ApiUrls.serverApi) + (ApiUrls.publicComics)
        
        }
    }
    
}
