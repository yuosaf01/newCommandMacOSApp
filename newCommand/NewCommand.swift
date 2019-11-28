//
//  File.swift
//  newCommand
//
//  Created by iMac on 28/11/2019.
//  Copyright © 2019 yuosaf01. All rights reserved.
//

import Foundation

public class NewCommand {

    class func shell(_ command: String) -> String {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", command]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        
        return output
    }

}
