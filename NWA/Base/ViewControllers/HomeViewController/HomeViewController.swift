//
//  HomeViewController.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/14/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SVProgressHUD


class HomeViewController: UIViewController {

    let homeViewRepresentation = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.getMarvel()
    }
    
    @IBAction func logout(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Sair", message: "Sair Mesmo?", preferredStyle: .actionSheet)
        
        let yesButton = UIAlertAction(title: "Sim", style: .default) { (action:UIAlertAction) in
            
            self.homeViewRepresentation.logout()
            ChangeStoryboard.changeStoryboard(storyboardName: "Main", viewControllerIdentifier: "LoginViewController")
        }
        let noButton = UIAlertAction(title: "Não", style: .destructive) { (action:UIAlertAction) in
            print("No")
        }
        
        alertController.addAction(yesButton)
        alertController.addAction(noButton)
        
        present(alertController, animated: true, completion: nil)

        
        
    }
    
    //MARK: Request
    func getMarvel() -> Void {
        
        self.homeViewRepresentation.getMarvelService(successBlock: { () in
                        
            print("foi")

            
            
        }) { (stringError) in
            print("Error Pow")
                
        }
        
    }
    
}
