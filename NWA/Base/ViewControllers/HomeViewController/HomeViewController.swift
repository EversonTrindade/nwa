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


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let homeViewRepresentation = HomeViewModel() as HomePresentation
    
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
        
        
    }
    
    //MARK: Request
    func getMarvel() -> Void {
        
        self.homeViewRepresentation.getMarvelService(successBlock: { () in
                        
            print("foi")
        }) { (stringError) in
            print("Error Pow")
                
        }
    }
    
    //MARK: UITableViewDelegate/Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeViewRepresentation.countOfCharacters
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell
        self.tableView(tableView, willDisplay: cell!, forRowAt: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
    }
    
}
