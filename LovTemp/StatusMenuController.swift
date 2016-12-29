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
    @IBOutlet weak var temperatureView: NSView!
    var weatherMenuItem: NSMenuItem!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    
    override func awakeFromNib() {
        statusItem.title = "LovBar"
        statusItem.menu = statusMenu
        
        weatherMenuItem = statusMenu.item(withTitle: "Temperature")
        weatherMenuItem.view = temperatureView
        // Insert code here to initialize your application
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
}
