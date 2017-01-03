//
//  StatusMenuController.swift
//  LovTemp
//
//  Created by Joakim Antman on 29.12.16.
//  Copyright © 2016 Lovsala. All rights reserved.
//

import Cocoa
import Foundation

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var tempController: NSViewController!
    @IBOutlet weak var imagesStack: NSStackView?
    @IBOutlet weak var imageView: NSImageView!
    
    let lovAPI = LovAPI()
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        statusItem.title = "LovBar"
        statusItem.menu = statusMenu
        
        lovAPI.fetchLatestImage(user: "balcony") { imageData in
            let dynamicMenuItem = NSMenuItem()
            self.statusMenu.addItem(dynamicMenuItem)
            dynamicMenuItem.title = "Test"
            dynamicMenuItem.isEnabled = true
            self.imageView.image = NSImage(data: imageData)
            dynamicMenuItem.view = self.imageView
            
        }
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
