//
//  HomeViewModel.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/14/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class HomeViewModel: UIViewController, HomePresentation {
    
    let countOfCharacters: NSInteger = GOTModel.getCountOfAllObjects()
    
    
    func logout() -> Void{
        
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    
    func getMarvelService(successBlock: ((Void) -> ()), failureBlock: @escaping ((String?) -> ())){
        
        Request.requestAPI(callType: .GOT, successBlock: { (transfers) in
        
            GOTModel.persistOrUpdateJsonFromService(json: transfers)
            
        }) { (stringError) in
            failureBlock(stringError)
        }
    }
    
}
