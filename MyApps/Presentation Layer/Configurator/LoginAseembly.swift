//
//  LoginAseembly.swift
//  MyApps
//
//  Created by Dinmukhamed on 13.02.2023.
//

import Foundation

final class LoginAssembly {
    
    static func create() -> LoginViewController {
        let vc = LoginViewController()
        vc.loginViewModel = AccountsViewModel()
        vc.coordinator = LoginCoordinator(navigationViewController: vc.navigationController!)

        
        return vc
    }
}
