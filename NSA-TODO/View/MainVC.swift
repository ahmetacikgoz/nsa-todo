//
//  MainVC.swift
//  NSA-TODO
//
//  Created by Tunc Tugcu on 31.07.2018.
//  Copyright © 2018 Tunc Tugcu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItems = rightBarButtonItems()
    }
    
    func rightBarButtonItems() -> [UIBarButtonItem] {
        return []
    }
}
