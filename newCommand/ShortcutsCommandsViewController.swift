//
//  ShortcutsCommandsViewController.swift
//  newCommand
//
//  Created by iMac on 27/11/2019.
//  Copyright © 2019 yuosaf01. All rights reserved.
//

import Cocoa

class ShortcutsCommandsViewController: NSViewController {
  
    @objc dynamic var commands:[Command] = []

    override func viewDidAppear() {
        
        commands.removeAll()
        
        let profile = NewCommand.shell("echo \"$(cat ~/.profile)\"")
        let lines = profile.components(separatedBy: "\n")

        for line in lines {
            
            if line.hasPrefix("alias ") {
                
                let myKey = extractText(sentence:line, from: "alias ", to: "='")
                let myValue = extractText(sentence:line, from: "alias \(myKey)='", to: "'")
                
                if !profile.contains("unalias \(myKey)") {
                    
                    commands.append(Command(key: myKey, command: myValue))
                }
            }
        }
    }
    
    func extractText(sentence: String,from:String, to:String) -> String {
        let pattern = "\(from)([^\"]+)\(to)"
        let regex = try! NSRegularExpression(pattern: pattern)


        if let match = regex.firstMatch(in: sentence, range: NSRange(sentence.startIndex..., in: sentence)) {
            let range = Range(match.range(at: 1), in: sentence)!
            return String(sentence[range])
        }

        return ""
    }
}
