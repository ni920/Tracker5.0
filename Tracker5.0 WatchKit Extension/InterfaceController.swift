//
//  InterfaceController.swift
//  Tracker5.0 WatchKit Extension
//
//  Created by Nico Saia on 10.06.20.
//  Copyright © 2020 Nico Saia. All rights reserved.
//

import WatchKit
import Foundation
import Darwin


class InterfaceController: WKInterfaceController {
     
    @IBAction func pushSecondInterfaceController() {
        pushController(withName: "secondInterface", context: nil)
    }
    
    @IBAction func quitApp(){
        exit(1) //unschön gelöst beim 2.Start gehen die Werte nicht mehr!
    }
}
