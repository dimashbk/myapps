//
//  Coordinator.swift
//  MyApps
//
//  Created by Dinmukhamed on 15.02.2023.
//

import Foundation
import UIKit


enum Event{
    case buttonTapped
    case toTableVC
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }

    func eventOccured(type: Event)
    
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

