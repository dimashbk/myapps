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
    case toAddVC
}
struct Navigation{
    let type: Event
    let key: String?
    
}
protocol Coordinator {
    var navigationController: UINavigationController? { get set }

    func eventOccured(type: Navigation)
    
    var children: [Coordinator]? { get set }
    
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

