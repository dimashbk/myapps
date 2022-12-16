//
//  ViewController.swift
//  MyApps
//
//  Created by Dinmukhamed on 16.12.2022.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let nameLabel = UILabel()
    let loginLabel = UILabel()
    let loginTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let statusLabel = UILabel()
    let registerQLabel = UILabel()
    let registerButton = UIButton()
    
    var loginViewModel = AccountsViewModel()
    
    let tableVC = MainTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bindViewModel()
        
    }


}



extension LoginViewController{
    private func initialize(){
        view.backgroundColor = .white
        
        //App name label
        nameLabel.text = "MyApps"
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(120)
        }
        //login label
        loginLabel.text = "Login"
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(nameLabel).inset(50)
            maker.left.equalToSuperview().inset(50)
        }
        //login textField
        
        view.addSubview(loginTextField)
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "Login"
        loginTextField.snp.makeConstraints{ maker in
            maker.top.equalTo(loginLabel).inset(25)
            maker.left.right.equalToSuperview().inset(50)
        }
       //password label
        passwordLabel.text = "Password"
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(loginTextField).inset(50)
            maker.left.equalToSuperview().inset(50)
        }
        //password textField
        view.addSubview(passwordTextField)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.snp.makeConstraints{ maker in
            maker.top.equalTo(passwordLabel).inset(25)
            maker.left.right.equalToSuperview().inset(50)
        }
        //login button
        view.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(.lightGray, for: .focused)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        loginButton.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(passwordTextField).inset(50)
            maker.width.equalTo(100)
            
        }
        //login target
        loginButton.addTarget(self,  action: #selector(loginButtonPressed), for: .touchUpInside)
        
        //status label
        statusLabel.text = "Status"
        statusLabel.textColor = .white
        view.addSubview(statusLabel)
        statusLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(loginButton).inset(70)
            maker.centerX.equalToSuperview()
        }
        //register question label
        registerQLabel.text = "Don't have an account?"
        view.addSubview(registerQLabel)
        registerQLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(loginButton).inset(120)
            maker.centerX.equalToSuperview()
        }
        //register button
        registerButton.setTitle("register", for: .normal)
        registerButton.setTitleColor( UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1), for: .normal)
        registerButton.setTitleColor(.lightGray, for: .focused)
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints{maker in
            maker.top.equalTo(loginButton).inset(140)
            maker.centerX.equalToSuperview()
        }
        registerButton.addTarget(self,  action: #selector(registerButtonPressed), for: .touchUpInside)

        
        
    }
    //binding viewModel
    func bindViewModel(){
        loginViewModel.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
        
    }

    //loginButton pressed action
    @objc func loginButtonPressed(){
        
        if  loginViewModel.userButtonPressed(login: (loginTextField.text) ?? "", password: passwordTextField.text ?? "")
        {
            show(tableVC, sender: loginButton)
            statusLabel.textColor = .systemGreen
        }else{
            statusLabel.textColor = .red
        }
        

    }
    @objc func registerButtonPressed(){
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
       
    }

    
    
}
