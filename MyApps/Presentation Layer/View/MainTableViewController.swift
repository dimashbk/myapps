//
//  MainTableViewController.swift
//  MyApps
//
//  Created by Dinmukhamed on 23.12.2022.
//

import UIKit

class MainTableViewController: UITableViewController, Coordinating {
    var coordinator: Coordinator?
    

    let cellId = "accountCell"
    let addEditTVC = AddEditViewController()
    var appsViewModel = AppsViewModel()
    var accountsViewModel = AccountsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddButtonTaped))
        navigationItem.hidesBackButton = false
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = true
        secondBindViewModel()
        firstBindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()

        
    }
    func firstBindViewModel(){
        self.accountsViewModel.updateViewData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    func secondBindViewModel(){
        self.appsViewModel.updateViewData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @objc func AddButtonTaped(){
        navigationController?.pushViewController(addEditTVC, animated: true)
        addEditTVC.appsViewModel.someKey = self.appsViewModel.someKey
        
    }
    @objc func BackButtonTaped(){
        print("tap")
        navigationController?.popViewController(animated: true)
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appsViewModel.setStorage(appsViewModel.someKey).accounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MyTableViewCell
        let App = appsViewModel.setStorage(appsViewModel.someKey).accounts[indexPath.row]
        let status = App.status
        cell.myImageView.image = cell.setImage(name: App.image!)
        cell.loginLabel.text = App.login
        cell.passwordLabel.text = { status in
            if status == true {
                return App.password
            }else{
                return "••••••••"
            }
        }(status)
        
        return cell
    }
    override func tableView(_ tableView: UITableView,
               heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 70
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let App = appsViewModel.setStorage(appsViewModel.someKey)
        App.removeAccounts(row: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let App = appsViewModel.setStorage(appsViewModel.someKey).accounts[indexPath.row]
        //creating an alert
        let alertController = UIAlertController(title: "Access", message: "Enter your password", preferredStyle: .alert)
        //alert textfield
        alertController.addTextField{ (textField) in
            textField.isSecureTextEntry = true
        }
        //alert action
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            if !self.accountsViewModel.passwordAccess(login: self.appsViewModel.someKey, password: alertController.textFields?.first?.text ?? "" ){
                self.appsViewModel.setStorage(self.appsViewModel.someKey).changeStatus(row: indexPath.row)
                print((alertController.textFields?.first?.text)! + "+" + self.appsViewModel.someKey)
                tableView.reloadData()
            }
        }
        alertController.addAction(action)
        
        //action for swipe
        let actionSwipeInstance = UIContextualAction(style: .normal, title: "Password") { _,_,_  in
            if App.status == false{
                self.present(alertController, animated: true)
            }
            else{
                self.appsViewModel.setStorage(self.appsViewModel.someKey).changeStatus(row: indexPath.row)
            }
            tableView.reloadData()
        }

        let actionsConfiguration = UISwipeActionsConfiguration(actions: [actionSwipeInstance])
        return actionsConfiguration
    }
}
