//
//  LoginViewModel.swift
//  MyApps
//
//  Created by Dinmukhamed on 16.12.2022.
//

import Foundation

class AccountsViewModel {
    
    var statusText = Dynamic("")
    var userStorage = UserStorage(key: "accounts")
    var updateViewData: (() -> ())?
    //checking account
    public func  userButtonPressed(login: String, password:String) -> Bool{
        
        if userStorage.accounts.isEmpty{
            
            statusText.value = "Log in failed"
        }else{
            
            var userIndex = -1
            if userDoesExist(login: login, password: password).0
            {
                
                userIndex = userDoesExist(login: login, password: password).1!
                
                if  login !=  userStorage.accounts[userIndex].login || password != userStorage.accounts[userIndex].password{
                    statusText.value = "Log in failed"
                }else{
                    statusText.value =  "You succesfully loged in"
                    return true
                }
            }else
            {
                statusText.value = "Log in failed"
            }
        }
        return false
    }
    
    //registration account
    public func  userRegButtonPressed(login: String, password:String){
        let userData = UserData(login: login, password: password)
        if (userStorage.accounts.isEmpty && AccountsViewModel.isPasswordValid(userData.password))
            || (!userDoesExist(login: userData.login, password: userData.password).0
            && AccountsViewModel.isPasswordValid(userData.password)) {
            
            userStorage.saveAccounts(login: login, password: password)
            statusText.value =  "Registration is succesfully completed"
        }else{
            
            statusText.value =  "Registration is failed"
        }
    }
    //checking account for existance
    public func userDoesExist(login: String, password:String) -> (Bool,Int?){
        
        var doesExist = (false, -1)
        let userData = UserData(login: login, password: password)
        
        for i in 0...(userStorage.accounts.count - 1){
            
            if userData.login == userStorage.accounts[i].login
            {
                
                doesExist = (true, i)
                
            }
        }
        return doesExist
        
    }
    //checking is the password valid
    public static func isPasswordValid(_ password : String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
        
    }
    public func  passwordAccess(login: String, password:String) -> Bool{
        
        let userIndex = userDoesExist(login: login, password: password).1!
        
        if  login !=  userStorage.accounts[userIndex].login ||
            password != userStorage.accounts[userIndex].password
        {
            
            return true

        }
        else
        {
            
            return false
            
        }
        
    }
   
}
    

