//
//  Command.swift
//  newCommand
//
//  Created by iMac on 19/10/2019.
//  Copyright © 2019 yuosaf01. All rights reserved.
//

import Foundation

class Command: NSObject {
    
    @objc dynamic var key: String
    @objc dynamic var command: String
    
    init(key: String, command: String) {
        self.key = key
        self.command = command
    }
}

