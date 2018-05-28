//
//  UserLocation.swift
//  ShineFInal
//
//  Created by davyngoma on 1/14/17.
//  Copyright © 2017 davyngoma. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
