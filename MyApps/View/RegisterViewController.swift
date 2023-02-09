//
//  RegisterViewController.swift
//  MyApps
//
//  Created by Dinmukhamed on 17.12.2022.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    let nameLabel = UILabel()
    let loginLabel = UILabel()
    let loginTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let statusLabel = UILabel()
    var registerViewModel = AccountsViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bindViewModel()
    }

}
extension RegisterViewController: UITextFieldDelegate{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.layer.masksToBounds = false
        loginButton.layer.shadowRadius = 7
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowColor = UIColor.purple.cgColor
        loginButton.layer.shadowPath = UIBezierPath(roundedRect: loginButton.bounds, cornerRadius: (loginButton.frame.height / 2 + 5)).cgPath
        
        loginTextField.layer.cornerRadius = loginButton.frame.height / 2
        loginTextField.layer.masksToBounds = false
        loginTextField.layer.shadowRadius = 7
        loginTextField.layer.shadowOpacity = 0.5
        loginTextField.layer.shadowColor = UIColor.purple.cgColor
        loginTextField.layer.shadowPath = UIBezierPath(roundedRect: loginTextField.bounds, cornerRadius: (loginTextField.frame.height)).cgPath
        
        passwordTextField.layer.cornerRadius = loginButton.frame.height / 2
        passwordTextField.layer.masksToBounds = false
        passwordTextField.layer.shadowRadius = 7
        passwordTextField.layer.shadowOpacity = 0.5
        passwordTextField.layer.shadowColor = UIColor.purple.cgColor
        passwordTextField.layer.shadowPath = UIBezierPath(roundedRect: loginTextField.bounds, cornerRadius: (loginTextField.frame.height)).cgPath
    }
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
        self.loginTextField.delegate = self
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
        self.passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.snp.makeConstraints{ maker in
            maker.top.equalTo(passwordLabel).inset(25)
            maker.left.right.equalToSuperview().inset(50)
        }
        //register button
        view.addSubview(loginButton)
        loginButton.setTitle("Register", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(.lightGray, for: .focused)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor =  UIColor(red: 104/255, green: 192/255, blue: 215/255, alpha: 1)
        loginButton.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(passwordTextField).inset(70)
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
        
        
        
    }
    //binding viewModel
    func bindViewModel(){
        registerViewModel.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
    }

    //loginButton pressed action
    @objc func loginButtonPressed(){
        registerViewModel.userRegButtonPressed(login: (loginTextField.text) ?? "", password: passwordTextField.text ?? "")
        statusLabel.textColor = .gray
        
    }
    //hide keyboard using button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
    //hide keyboard pressing anywhere
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing (true)
    }


}
