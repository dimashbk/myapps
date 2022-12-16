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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension RegisterViewController{
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
        //register button
        view.addSubview(loginButton)
        loginButton.setTitle("Register", for: .normal)
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

}
