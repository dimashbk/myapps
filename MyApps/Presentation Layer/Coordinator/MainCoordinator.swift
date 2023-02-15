//
//  MainCoordinator.swift
//  MyApps
//
//  Created by Dinmukhamed on 15.02.2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator{
    var navigationController: UINavigationController?
    
    func eventOccured(type: Event) {
        switch type{
            
        case .buttonTapped:
            var vc: UIViewController & Coordinating = RegisterViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            
        case .toTableVC:
            var vc: UIViewController & Coordinating = MainTableViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            
        }

        
    }
    
    func start() {
        var vc: UIViewController & Coordinating = LoginViewController() 
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    
}
 
