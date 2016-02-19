//
//  ViewMassController.swift
//  pizzappW
//
//  Created by Pollinion User on 18/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import WatchKit
import Foundation


class ViewMassController: WKInterfaceController {

    @IBOutlet var mass_selector: WKInterfacePicker!
    var prepare_pizza: Pizza?
    var mass_pizza: String = ""
    var itemList: [ String] = [
        "delgada",
        "crujiente",
        "gruesa"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        prepare_pizza = context as? Pizza
        
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0
            pickerItem.title = $0
            return pickerItem
        }
        self.mass_pizza = "delgada"
        self.mass_selector.setItems(pickerItems)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
     
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pickerChanged(value: Int) {
        self.mass_pizza = itemList[value]
    }
    @IBAction func action_prepare() {
        prepare_pizza?.mass = mass_pizza
        pushControllerWithName("id_cheese", context: prepare_pizza)
        //print(size_pizza)
    }

}
