//
//  Person.swift
//  Project10
//
//  Created by SANDEEP BANDARU on 01/08/20.
//  Copyright © 2020 SANDEEP BANDARU. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
