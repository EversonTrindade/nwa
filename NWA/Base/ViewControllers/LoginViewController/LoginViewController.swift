//
//  LoginViewController.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/18/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController,FBSDKLoginButtonDelegate {

    @IBOutlet weak var customLoginButton: FBSDKLoginButton!
    
    let loginViewRepresentation = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customLoginButton.delegate = self
        customLoginButton.readPermissions = ["email", "public_profile", "user_friends"]
    }
    
    override func viewWillAppear(_ animated: Bool) {

        self.loginViewRepresentation.checkToken()
    }

    //MARK: FBSDKLoginButtonDelegate
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        
        if error != nil{
            print(error.localizedDescription)
            
            return
        }
        
        if (result.token != nil) {
            
            let token:FBSDKAccessToken = result.token
            
            print("Token = \(token)")
            print("User ID = \(token.userID)")
            
            ChangeStoryboard.changeStoryboard(storyboardName: "Main", viewControllerIdentifier: "HomeViewController")
        }
    }
    
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        
        print("User is logged out")
    }


}
