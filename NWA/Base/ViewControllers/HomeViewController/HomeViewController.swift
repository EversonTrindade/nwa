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
import RealmSwift


class HomeViewController: UIViewController {

    let homeViewRepresentation = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
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
    @IBAction func getDatabase(_ sender: AnyObject) {
        
        let realm = try! Realm()

        let all = realm.objects(GOTModel.self)
        print(all)
        
        let each = realm.object(ofType: GOTModel.self, forPrimaryKey: "Jon Snow")
        
        if (each != nil){
            
            try! realm.write {
                
                realm.delete(each!)
            }
        }
            
        
        
        
        
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
