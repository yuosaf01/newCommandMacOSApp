//
//  ViewController.swift
//  newCommand
//
//  Created by iMac on 07/08/2019.
//  Copyright © 2019 yuosaf01. All rights reserved.
//

import Cocoa

class AddCommandViewController: NSViewController {

    @IBOutlet weak var myTextField_Command: NSTextField!
    @IBOutlet weak var myTextField_Key: NSTextField!

    @IBAction func myButton_Add_Action(_ sender: NSButton) {
        
        let myCommand = myTextField_Command.stringValue
        let myKey = myTextField_Key.stringValue
        
        if myCommand != "" {
            
            if myKey != "" {
                
                _ = NewCommand.shell("echo \"alias "+myKey+"='"+myCommand+"'\" >> '/Users/'$USER'/.profile'")
                              
                alert(messageText: "Done", informativeText: "You must reopen terminal to apply")

                myTextField_Command.stringValue = ""
                myTextField_Key.stringValue = ""
                
            }
            else {
                alert(messageText: "Error", informativeText: "Please enter key")
            }
            
        }
        else {
            alert(messageText: "Error", informativeText: "Please enter command")
        }
        
    }
    
    func alert(messageText:String,informativeText:String) {
        let alert = NSAlert()
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.addButton(withTitle: "Ok")
        alert.beginSheetModal(for: self.view.window!)
    }
}

