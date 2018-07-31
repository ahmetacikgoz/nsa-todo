//
//  Coordinator.swift
//  NSA-TODO
//
//  Created by Tunc Tugcu on 31.07.2018.
//  Copyright © 2018 Tunc Tugcu. All rights reserved.
//

import UIKit

class Coordinator: NSObject {
    let navigationController: UINavigationController
    func start() {
        preconditionFailure("Child coordinator must implement")
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
