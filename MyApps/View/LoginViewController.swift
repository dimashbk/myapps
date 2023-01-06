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
    let myImageView = UIImageView()
    let image = UIImage(named: "AppIcon")
    
    var loginViewModel = AccountsViewModel()
    
    let tableVC = MainTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bindViewModel()
        
    }


}



extension LoginViewController:  UITextFieldDelegate{

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
        nameLabel.text = ""
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(120)
        }
        //ImageView
        myImageView.contentMode = .scaleAspectFill
        myImageView.image = image
        myImageView.layer.borderColor = .none
        myImageView.layer.cornerRadius = 70
        myImageView.layer.masksToBounds = true
        view.addSubview(myImageView)
        myImageView.snp.makeConstraints{maker in
            maker.top.equalTo(nameLabel).inset(20)
            maker.width.height.equalTo(140)
            maker.centerX.equalToSuperview()
        }
        
        
        //login label
        loginLabel.text = "Login"
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(nameLabel).inset(150)
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
