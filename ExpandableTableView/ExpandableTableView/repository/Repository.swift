//
//  Repository.swift
//  ExpandableTableView
//
//  Created by Mark on 24/08/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

import Foundation

class Repository {
 
    func getSomeColors() -> [Color] {
        
        let reds = Color(name: "red", thingsOfColor: ["apple", "blood", "the moon, sometimes"])
        let blues = Color(name: "blue", thingsOfColor: ["the sea", "the sky", "earth"])
        let yellows = Color(name: "yellow", thingsOfColor: ["sun", "mangoes", "bananas", "ducks", "bees"])
        
        return [reds, blues, yellows]
    }
    
}
