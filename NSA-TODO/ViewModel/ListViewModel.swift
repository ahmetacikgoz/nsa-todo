//
//  ListViewModel.swift
//  NSA-TODO
//
//  Created by Tunc Tugcu on 31.07.2018.
//  Copyright © 2018 Tunc Tugcu. All rights reserved.
//

import Foundation

protocol ListViewModelViewProtocol: AnyObject {
    func refreshList()
}

class ListViewModel: NSObject {
    private var events = [Event]()
    
    weak var delegate: ListViewModelViewProtocol?
    
    func getNumberOfEvents() -> Int {
        return events.count
    }
    
    func getEventForIndexPath(_ indexPath: IndexPath) -> Event? {
        let index = indexPath.row
        guard getNumberOfEvents() > index else { return nil }
        return events[index]
    }
    
    func addEvent(_ event: Event) {
        events.append(event)
        delegate?.refreshList()
    }
}
