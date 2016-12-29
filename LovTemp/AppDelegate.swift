//
//  AppDelegate.swift
//  LovTemp
//
//  Created by Jakke on 29.12.16.
//  Copyright © 2016 lovsala. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusMenuController: StatusMenuController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
       statusMenuController.applicationDidFinishLaunching()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

