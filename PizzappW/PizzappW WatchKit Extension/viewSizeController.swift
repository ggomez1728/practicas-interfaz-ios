//
//  ViewSizeController.swift
//  pizzappW
//
//  Created by Pollinion User on 18/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import WatchKit
import Foundation


class ViewSizeController: WKInterfaceController {

    @IBOutlet var size_selector: WKInterfacePicker!
    var size_pizza: String = ""
    var itemList: [ String] = [
         "chica",
         "mediana",
         "grande"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0
            pickerItem.title = $0
            return pickerItem
        }
        self.size_pizza = "chica"
        self.size_selector.setItems(pickerItems)
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
        self.size_pizza = itemList[value]
    }
    
    @IBAction func action_prepare() {
        let pizza_prepare = Pizza()
        pizza_prepare.size = size_pizza
        pushControllerWithName("id_mass", context: pizza_prepare)
        //print(size_pizza)
    }

}
