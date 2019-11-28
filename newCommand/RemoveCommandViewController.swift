//
//  RemovrCommandViewController.swift
//  newCommand
//
//  Created by iMac on 27/11/2019.
//  Copyright © 2019 yuosaf01. All rights reserved.
//

import Cocoa

class RemoveCommandViewController: NSViewController {

    @IBOutlet weak var myTextField_Key_Remove: NSTextField!
    
    @IBAction func myButton_Remove_Action(_ sender: NSButton) {

        let Key = myTextField_Key_Remove.stringValue

        if Key != "" {

            _ = NewCommand.shell("echo \"unalias "+Key+"\" >> '/Users/'$USER'/.profile'")
            
            alert(messageText: "Done", informativeText: "You must reopen terminal to apply")

            myTextField_Key_Remove.stringValue = ""

        }
        else {

            alert(messageText: "Error", informativeText: "Please enter key")
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
