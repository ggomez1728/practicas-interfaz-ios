//
//  ViewOrderController.swift
//  pizzappW
//
//  Created by Pollinion User on 19/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import WatchKit
import Foundation


class ViewOrderController: WKInterfaceController {

    var prepare_pizza: Pizza?

    @IBOutlet var size_pizza: WKInterfaceLabel!
    @IBOutlet var mass_pizza: WKInterfaceLabel!
    @IBOutlet var cheese_pizza: WKInterfaceLabel!
    @IBOutlet var ingredients_pizza: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        prepare_pizza = context as? Pizza
        size_pizza.setText(prepare_pizza?.size)
        mass_pizza.setText(prepare_pizza?.mass)
        cheese_pizza.setText(prepare_pizza?.cheese)
        var show_ingredients:String = ""
        for ingredient in (prepare_pizza?.ingredients)! {
            show_ingredients += "\(ingredient) \n"
        }
        ingredients_pizza.setText(show_ingredients)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
