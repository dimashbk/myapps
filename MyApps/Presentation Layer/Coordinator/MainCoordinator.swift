//
//  MainCoordinator.swift
//  MyApps
//
//  Created by Dinmukhamed on 15.02.2023.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator{
    var navigationController: UINavigationController?
    
    func eventOccured(type: Navigation) {
        
        switch type.type{
            
        case .buttonTapped:
            var vc: UIViewController & Coordinating = RegisterViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            
        case .toTableVC:
            let vc: MainTableViewController & Coordinating = MainTableViewController()
            vc.coordinator = self
            vc.appsViewModel.someKey = type.key ?? ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    var children: [Coordinator]? = nil
    
    func start() {
        var vc: UIViewController & Coordinating = LoginViewController() 
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    
}
 
