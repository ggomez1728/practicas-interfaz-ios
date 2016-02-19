//
//  Pizza.swift
//  pizzappW
//
//  Created by Pollinion User on 18/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import WatchKit

class Pizza: NSObject {
    var size: String = ""
    var mass: String = ""
    var cheese: String = ""
    var ingredients: [String] = []
    override init() {
        size = ""
        mass = ""
        cheese = ""
        ingredients = []
    }

}
