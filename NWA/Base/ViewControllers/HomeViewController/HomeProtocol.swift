//
//  HomeProtocol.swift
//  NWA
//
//  Created by Everson P. Trindade on 10/14/16.
//  Copyright © 2016 Everson P. Trindade. All rights reserved.
//

import UIKit

protocol HomePresentation{

    func logout() -> Void
 
    func getMarvelService(successBlock: ((Void) -> ()), failureBlock: ((String?) -> ()))
    
}
