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
    var apps = ["github","instagram","AppIcon","whatsapp","telegram","vk","origin","twitter","snapchat","tiktok","steam","linkedin"]
    var updateViewData: (() -> ())?
    init(key: String) {
        self.key = key
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
        updateViewData?()
    }
    func changeStatus(row: Int)
    {
        accounts[row].status = !accounts[row].status
        updateViewData?()

    }
}
