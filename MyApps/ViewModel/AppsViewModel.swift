//
//  AppsViewModel.swift
//  MyApps
//
//  Created by Dinmukhamed on 07.01.2023.
//

import Foundation

class AppsViewModel{
    
    var someKey = ""
    var statusText = Dynamic("")

    
    //registration account
    public func  userSaveButtonPressed(login: String, password:String, image: String){
        if (setStorage(someKey).accounts.isEmpty || !userDoesExist(login: login, password: password).0) {
            setStorage(someKey).saveAccounts(login: login, password: password, image: image)
        }else{
       
            print("no")
        }
    }
    //checking account for existance
    public func userDoesExist(login: String, password:String) -> (Bool,Int?){
        var doesExist = (false, -1)
        for i in 0...(setStorage(someKey).accounts.count - 1){
            if login == setStorage(someKey).accounts[i].login
            {
                doesExist = (true, i)
            }
        }
        return doesExist
    }
    
    func setStorage(_ key: String) -> AccountStorage{
        let accountStorage = AccountStorage(key: key)
        return accountStorage
    }
   
}
    

