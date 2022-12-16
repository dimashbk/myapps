//
//  loginModel.swift
//  MyApps
//
//  Created by Dinmukhamed on 16.12.2022.
//

import Foundation

protocol UserSettings{
    var login: String? {get set}
    var password: String?{get set}
}

struct User: UserSettings{
    var login: String?
    var password: String?
}

