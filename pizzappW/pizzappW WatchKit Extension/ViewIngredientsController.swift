//
//  ViewIngredientsController.swift
//  pizzappW
//
//  Created by Pollinion User on 18/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import WatchKit
import Foundation

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int)
    {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

class ViewIngredientsController: WKInterfaceController {

    var prepare_pizza: Pizza?
    
    var ingredients_pizza : [String] = []
    
    @IBOutlet var jamon_btn: WKInterfaceButton!
    
    @IBOutlet var pepper_btn: WKInterfaceButton!
    
    @IBOutlet var pavo_btn: WKInterfaceButton!

    @IBOutlet var salchicha_btn: WKInterfaceButton!

    @IBOutlet var aceituna_btn: WKInterfaceButton!

    @IBOutlet var cebolla_btn: WKInterfaceButton!

    @IBOutlet var pimiento_btn: WKInterfaceButton!
    
    @IBOutlet var pina_btn: WKInterfaceButton!

    @IBOutlet var anchoa_btn: WKInterfaceButton!

    
    @IBAction func jamon_select() {
        select_ingredient(ingr: "jamon", btn: jamon_btn)
    }
    
    @IBAction func pepper_select() {
        select_ingredient(ingr: "pepperoni", btn: pepper_btn)
    }
    
    @IBAction func pavo_select() {
        select_ingredient(ingr: "pavo", btn: pavo_btn)
    }
    @IBAction func salchicha_select() {
        select_ingredient(ingr: "salchicha", btn: salchicha_btn)
    }

    @IBAction func aceituna_select() {
        select_ingredient(ingr: "aceituna", btn: aceituna_btn)
    }

    @IBAction func cebolla_select() {
        select_ingredient(ingr: "cebolla", btn: cebolla_btn)
    }

    @IBAction func pimiento_select() {
        select_ingredient(ingr: "pimiento", btn: pimiento_btn)
    }

    @IBAction func pina_select() {
        select_ingredient(ingr: "piña", btn: pina_btn)
    }

    @IBAction func anchoa_select() {
        select_ingredient(ingr: "anchoa", btn: anchoa_btn)
        
    }

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
           prepare_pizza = context as? Pizza
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    func select_ingredient(ingr ingr: String, btn: WKInterfaceButton){
        if ingredients_pizza.count < 5 {
            if ingredients_pizza.contains(ingr){
                let indexOfElement = ingredients_pizza.indexOf(ingr)
                ingredients_pizza.removeAtIndex(indexOfElement!)
                select_des_btn(btn)
            }
            else {
                ingredients_pizza.append(ingr)
                select_en_btn(btn)
            }
        }
        else{
            if ingredients_pizza.contains(ingr){
                let indexOfElement = ingredients_pizza.indexOf(ingr)
                ingredients_pizza.removeAtIndex(indexOfElement!)
                select_des_btn(btn)
            }
            else{
                let h0 = { print("ok")}
                let action1 = WKAlertAction(title: "Aceptar", style: .Default, handler:h0)
                presentAlertControllerWithTitle("No puede seleccionar mas de 5 ingredietnes", message: "", preferredStyle: .ActionSheet, actions: [action1])
            }
        }
        
    }
    
    func select_en_btn(btn: WKInterfaceButton ){
        btn.setBackgroundColor(UIColor(red: 255, green: 165, blue: 0))
    }
    func select_des_btn(btn: WKInterfaceButton ){
        btn.setBackgroundColor(.None)
    }
    
    @IBAction func action_prepare() {
        if ingredients_pizza.count > 0 {
            prepare_pizza?.ingredients = ingredients_pizza
            pushControllerWithName("id_order", context: prepare_pizza)
        }
        else{
            let h0 = { print("ok")}
            let action1 = WKAlertAction(title: "Aceptar", style: .Default, handler:h0)
            presentAlertControllerWithTitle("Seleccione entre 1 y 5 ingredietnes", message: "", preferredStyle: .ActionSheet, actions: [action1])
        }
    }
}
