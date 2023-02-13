//
//  LoginCoordinator.swift
//  MyApps
//
//  Created by Dinmukhamed on 13.02.2023.
//

import Foundation
import UIKit

struct LoginCoordinator {
    
    let navigationViewController: UINavigationController
    
    func moveToRegister() {
        let registerVC = RegisterViewController()
        navigationViewController.pushViewController(registerVC, animated: true)
    }
}

