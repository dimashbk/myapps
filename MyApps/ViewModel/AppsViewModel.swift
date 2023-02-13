//
//  AppsViewModel.swift
//  MyApps
//
//  Created by Dinmukhamed on 07.01.2023.
//

import Foundation

class AppsViewModel {
    
    var someKey = ""
    var statusText = Dynamic("")
    var updateViewData: (() -> ())?

    
    //registration account
    public func  userSaveButtonPressed(login: String, password:String, image: String){
        setStorage(someKey).saveAccounts(login: login, password: password, image: image)
        updateViewData?()
    }
    func userDelete(index: Int)
    {
        setStorage(someKey).removeAccounts(row: index)
        updateViewData?()
    }
    //setting storage
    func setStorage(_ key: String) -> AccountStorage{
        let accountStorage = AccountStorage(key: key)
        return accountStorage
    }
    //getting apps from storage
    func getApps() -> [String] {
        return setStorage(someKey).apps
        
    }
   
}
    

