//
//  AccountStorage.swift
//  MyApps
//
//  Created by Dinmukhamed on 07.01.2023.
//

import Foundation
class AccountStorage{
    let storage = UserDefaults.standard
    var key: String
    
    init(key: String) {
        self.key = key
    }
    
    struct AccountData: Codable, UserSettings{
        var login: String?
        var password: String?
        var image: String?
    }
    
    var accounts:[AccountData]
    {
        get{
            if let data = storage.value(forKey: key) as? Data{
                return try! PropertyListDecoder().decode([AccountData].self, from: data)
            }
            else{
                return [AccountData]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue)
            {
                storage.set(data, forKey: key)
            }
        }
    }
    
    func saveAccounts(login:String?, password:String?, image: String?){
        let account = AccountData(login: login, password: password, image: image)
        accounts.append(account)
    }
    func removeAccounts(row: Int){
        accounts.remove(at: row)
    }
}
