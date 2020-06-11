//
//  InterfaceController.swift
//  Tracker5.0 WatchKit Extension
//
//  Created by Nico Saia on 10.06.20.
//  Copyright © 2020 Nico Saia. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
     
    @IBAction func pushSecondInterfaceController() {
        pushController(withName: "secondInterface", context: nil)
    }
    
//    @IBOutlet var myPicker: WKInterfacePicker!
//
//    override init(){
//            super.init()
//            myPicker.setItems(setPickerItems())
//        }
//
//        func setPickerItems() -> [WKPickerItem] {
//            let firstItem = pickerItemWithTitle("Eins")
//            let secondItem = pickerItemWithTitle("Zwei")
//            let thirdItem = pickerItemWithTitle("Drei")
//            return [firstItem, secondItem, thirdItem]
//        }
//
//        func pickerItemWithTitle(_ title: String) -> WKPickerItem {
//            let pickerItem = WKPickerItem()
//            pickerItem.title = title
//            return pickerItem
//        }
        
}
