//
//  secondInterface_Controller.swift
//  Tracker5.0 WatchKit Extension
//
//  Created by Nico Saia on 11.06.20.
//  Copyright © 2020 Nico Saia. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit




class secondInterface_Controller: WKInterfaceController {

    private var auswahl: String = "leer"
    
    private var value: Int = 0
    
    public let healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    
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
    
    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        
        // We want data points from our current device
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        
        // A query that returns changes to the HealthKit store, including a snapshot of new changes and continuous monitoring as a long-running query.
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
         // A sample that represents a quantity, including the value and the units.
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }
            
        self.process(samples, type: quantityTypeIdentifier)

        }
        
        // It provides us with both the ability to receive a snapshot of data, and then on subsequent calls, a snapshot of what has changed.
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        
        // query execution
        
        healthStore.execute(query)
    }
    
    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0
        
        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }
            
            self.value = Int(lastHeartRate)
        }
    }
    
    func blah(){
    }
    
    @IBOutlet var label: WKInterfaceLabel!

    @IBOutlet var myPicker: WKInterfacePicker!
    
    @IBAction func pickerAction(_ wahl: Int){
        print("Es wurde gewählt: \(wahl)")
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
        self.label.setText("\(value)")
        print("\(value)")
        let array: [WKPickerItem] = setPickerItems()
        if (array[wahl].title != nil) {
            auswahl = array[wahl].title ?? "leer"
        }
    }
    
    @IBAction func erzeugeAusgabe() {
        print("\(self.auswahl)")
        let datum = Date()
        print("\(datum)")
        pushController(withName: "thirdinterface", context: nil)
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
    
    
    // MARK: - Health
}
