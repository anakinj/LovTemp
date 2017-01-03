//
//  StatusMenuController.swift
//  LovTemp
//
//  Created by Joakim Antman on 29.12.16.
//  Copyright © 2016 Lovsala. All rights reserved.
//

import Cocoa
import Foundation

//
// This is the main controller, gluing everything together.
//
class StatusMenuController: NSObject {
    // Menu shown in the task bar
    @IBOutlet weak var statusMenu: NSMenu!
    // Temperature Graph
    @IBOutlet weak var tempController: NSViewController!
    // Image view
    @IBOutlet weak var imageController: NSViewController!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        statusItem.title = "🦀"
        statusItem.menu = statusMenu

        LovAPI.session.configuration.user = "LovBar"
        LovAPI.session.configuration.api_key = "SECRET"
        
        //addGraphView()
        addImageView()
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    private
    
    func addGraphView()  {
        let dynamicMenuItem = NSMenuItem()
        self.statusMenu.addItem(dynamicMenuItem)
        dynamicMenuItem.title = "TemperatureGraph"
        dynamicMenuItem.view = self.tempController.view
    }
    
    func addImageView() {
        let dynamicMenuItem = NSMenuItem()
        self.statusMenu.addItem(dynamicMenuItem)
        dynamicMenuItem.title = "Images"
        dynamicMenuItem.view = self.imageController.view
    }
}
