//
//  AppCoordinator.swift
//  NSA-TODO
//
//  Created by Tunc Tugcu on 31.07.2018.
//  Copyright © 2018 Tunc Tugcu. All rights reserved.
//

import Foundation


final class AppCoordinator: Coordinator {
    
    private let listViewModel = ListViewModel()
    
    override func start() {
        let vc: ListVC = {
            let vc = ListVC(viewModel: listViewModel)
            listViewModel.delegate = vc
            vc.delegate = self
            return vc
        }()
        navigationController.setViewControllers([vc], animated: false)
    }
}

extension AppCoordinator: ListVCProtocol {
    func addEventPressed() {
        let vc = EventVC(viewModel: EventViewModel())
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func editEventPressed(event: Event) {
        
    }
}

extension AppCoordinator: EventVCDelegate {
    func didFinishWith(event: Event?) {
        if let event = event {
            listViewModel.addEvent(event)
        }
        
        guard (navigationController.topViewController as? EventVC) != nil else {
            print("topVC is not eventVC")
            return
        }
        
        
        navigationController.popViewController(animated: true)
    }
    
    
}
