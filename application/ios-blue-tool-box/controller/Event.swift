//
//  Event.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 29/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import Foundation

class Event<T> {
    
    typealias EventHandler = (T) -> ()
    
    private var eventHandlers = [EventHandler]()
    
    func addHandler(handler: @escaping(EventHandler)) {
        eventHandlers.append(handler)
    }
    
    func raise(data: T) {
        for handler in eventHandlers {
            handler(data)
        }
    }
}
