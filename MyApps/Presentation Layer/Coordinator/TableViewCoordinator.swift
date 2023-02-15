//
//  TableViewCoordinator.swift
//  MyApps
//
//  Created by Dinmukhamed on 15.02.2023.
//

import Foundation
import UIKit

final class TableCoordinator: Coordinator{
    
    var navigationController: UINavigationController?
    
    func eventOccured(type: Navigation) {
        
        switch type.type{
            
        case .toAddVC:
            let vc: AddEditViewController & Coordinating = AddEditViewController()
            vc.coordinator = self
            vc.appsViewModel.someKey = type.key ?? ""
            navigationController?.pushViewController(vc, animated: true)
        case .buttonTapped:
            print("hui1")
        case .toTableVC:
            print("hui2")
        }
    }
        
        var children: [Coordinator]?
        
        func start() {
            var vc: UIViewController & Coordinating = MainTableViewController()
            vc.coordinator = self
            navigationController?.setViewControllers([vc], animated: false)
        }
        
        
}
