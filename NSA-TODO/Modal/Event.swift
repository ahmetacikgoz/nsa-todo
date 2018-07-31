//
//  Event.swift
//  NSA-TODO
//
//  Created by Tunc Tugcu on 31.07.2018.
//  Copyright © 2018 Tunc Tugcu. All rights reserved.
//

import Foundation

enum EventNotificationSelection: String {
    case tenMin
}

struct Event: Codable {
    var topic: String
    var desc: String
    var date: Date
    
    static func build(topic: String, desc: String) -> Event {
        return Event(topic: topic, desc: desc, date: Date())
    }
    
}
