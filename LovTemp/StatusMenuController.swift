//
//  StatusMenuController.swift
//  LovTemp
//
//  Created by Joakim Antman on 29.12.16.
//  Copyright © 2016 Lovsala. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var tempController: NSViewController!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        statusItem.title = "LovBar"
        statusItem.menu = statusMenu
    }
    
    func applicationDidFinishLaunching() {
        let dynamicMenuItem = NSMenuItem()
        self.statusMenu.addItem(dynamicMenuItem)
        dynamicMenuItem.title = "Test"
        dynamicMenuItem.isEnabled = true
        dynamicMenuItem.view = self.tempController.view
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
}
