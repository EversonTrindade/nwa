//
//  LoginViewModel.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/18/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewModel: NSObject, LoginPresentation {

    func checkToken() -> Void{
        
        if (FBSDKAccessToken.current() != nil) {
            
            ChangeStoryboard.changeStoryboard(storyboardName: "Main", viewControllerIdentifier: "HomeViewController")
        }else{
            
            print("Off")
        }
    }
}
