//
//  AccountData.swift
//  MyApps
//
//  Created by Dinmukhamed on 10.02.2023.
//

import Foundation
protocol AccountSettings{
    
    var login: String? {get set}
    var password: String? {get set}
    var image: String? {get set}
    var status: Bool {get set}
    
}
struct AccountData: Codable, AccountSettings{
    
    var login: String?
    var password: String?
    var image: String?
    var status = false
    
}
