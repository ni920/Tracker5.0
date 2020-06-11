//
//  secondInterface Controller.swift
//  Tracker5.0 WatchKit Extension
//
//  Created by Nico Saia on 11.06.20.
//  Copyright © 2020 Nico Saia. All rights reserved.
//

import WatchKit
import Foundation


class secondInterface_Controller: WKInterfaceController {

    private var auswahl: String = "leer"
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBOutlet var myPicker: WKInterfacePicker!
    
    @IBAction func pickerAction(_ value: Int){
        print("Es wurde gewählt: \(value)")
        let array: [WKPickerItem] = setPickerItems()
        if (array[value].title != nil) {
            auswahl = array[value].title ?? "leer"
        }
    }
    
    @IBAction func erzeugeAusgabe() {
        print("\(self.auswahl)")
        let datum = Date()
        print("\(datum)")
    }
    
        override init(){
                super.init()
                myPicker.setItems(setPickerItems())
                myPicker.focus()
            }
    
            func setPickerItems() -> [WKPickerItem] {
                let sehrSchwach = pickerItemWithTitle("Sehr Schwach")
                sehrSchwach.caption = "Wie Stark?"
                let schwach = pickerItemWithTitle("Schwach")
                schwach.caption = "Wie Stark?"
                let  mittel = pickerItemWithTitle("Mittel")
                mittel.caption = "Wie Stark?"
                let stark = pickerItemWithTitle("Stark")
                stark.caption = "Wie Stark?"
                let sehrStark = pickerItemWithTitle("Sehr Stark")
                sehrStark.caption = "Wie Stark?"
                return [sehrSchwach, schwach, mittel, stark, sehrStark]
            }
    
            func pickerItemWithTitle(_ title: String) -> WKPickerItem {
                let pickerItem = WKPickerItem()
                pickerItem.title = title
                return pickerItem
            }
}
