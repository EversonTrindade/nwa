//
//  ChangeStoryboard.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/18/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import UIKit

public class ChangeStoryboard{

    class func changeStoryboard(storyboardName: String, viewControllerIdentifier: String) -> Void{
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        let pageNavigation = UINavigationController(rootViewController: viewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = pageNavigation
        
    }
}
