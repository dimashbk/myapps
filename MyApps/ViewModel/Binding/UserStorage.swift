//
//  UserStorage.swift
//  MyApps
//
//  Created by Dinmukhamed on 17.12.2022.
//

import Foundation



class UserStorage{
    let storage = UserDefaults.standard
    var key = "accounts"
    init(key: String) {
        self.key = key
    }
    
    struct UserData: Codable, UserSettings{
        var login: String?
        var password: String?
    }
    
    var accounts:[UserData]
    {
        get{
            if let data = storage.value(forKey: key) as? Data{
               return try! PropertyListDecoder().decode([UserData].self, from: data)
            }
            else{
                return [UserData]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue)
            {
                storage.set(data, forKey: key)
            }
        }
    }
    
    func saveAccounts(login:String?, password:String?){
        let account = UserData(login: login, password: password)
        accounts.insert(account, at: 0)
    }
}

