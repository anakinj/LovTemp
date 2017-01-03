//
//  ImageViewController.swift
//  LovTemp
//
//  Created by Jakke on 03.01.17.
//  Copyright © 2017 Lovsala. All rights reserved.
//

import Cocoa

class ImageViewController: NSViewController {

    @IBOutlet weak var imageView: NSButton!
    
    let USERS = ["front", "balcony", "inside"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
    }
    
    func updateImage()  {
        let nextUser = USERS[currentIndex]
        
        if currentIndex < USERS.count-1 {
            currentIndex += 1
        }
        else {
            currentIndex = 0
        }
        
        LovAPI.session.fetchLatestImage(user: nextUser) { (imageData) in
            NSLog("Got Image, pushing to UI!")
            DispatchQueue.main.async {
                self.imageView.image = NSImage(data: imageData)
            }
        }
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        updateImage()
    }
}
