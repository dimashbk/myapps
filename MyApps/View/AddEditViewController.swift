//
//  AddEditViewController.swift
//  MyApps
//
//  Created by Dinmukhamed on 06.01.2023.
//

import UIKit

class AddEditViewController: UIViewController, UIPickerViewDelegate {
    
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
    let picker = UIPickerView()
    var image = UIImage(named: "AppIcon")
    var appsViewModel = AppsViewModel()
    var somename = "steam"
    var apps = ["steam","instagram","AppIcon","whatsapp","telegram","vk","origin"]
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        


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

extension AddEditViewController: UITextFieldDelegate,UIPickerViewDataSource{
    
    
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
       
        
        //picker
        picker.delegate = self
        picker.dataSource = self
        
        view.addSubview(picker)
        picker.transform = CGAffineTransform(rotationAngle: -90  * (.pi/180))
        
        picker.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(100)
            maker.top.equalTo(passwordTextField).inset(5)
        }
        //login button
        view.addSubview(loginButton)
        loginButton.setTitle("Save", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(.lightGray, for: .focused)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = UIColor(red: 104/255, green: 192/255, blue: 215/255, alpha: 1)
        loginButton.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(passwordTextField).inset(190)
            maker.width.equalTo(100)
            
        }
        //login target
        loginButton.addTarget(self,  action: #selector(saveButtonPressed), for: .touchUpInside)
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return apps.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let modeView = UIView()
        modeView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let modeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        modeLabel.textColor = .black
        modeLabel.text = apps[row]
        modeLabel.textAlignment = .center
        modeView.addSubview(modeLabel)
        
        // Here the view rotates 90 degree on right side hence we are using positive value.
        modeView.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        return modeView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
         somename = apps[row]
    }

    //loginButton pressed action
    @objc func saveButtonPressed(){
        appsViewModel.userSaveButtonPressed(login: (loginTextField.text) ?? "", password: passwordTextField.text ?? "", image: somename)
    }
    //hide keyboard using button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
    //hide keyboard pressing anywhere
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
