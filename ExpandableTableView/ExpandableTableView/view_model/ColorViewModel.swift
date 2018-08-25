//
//  ColorViewModel.swift
//  ExpandableTableView
//
//  Created by Mark on 24/08/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

import Foundation
import UIKit

struct ColorViewModel {
    
    var headerTitle: String {
        return color.name
    }
    
    var backGroundColor: UIColor {
        switch color.name {
        case "red":
            return UIColor.red
        case "blue":
            return UIColor.blue
        case "yellow":
            return UIColor.yellow
        default:
            return UIColor.black
        }
    }
    
    var textColor: UIColor {
        switch color.name {
        case "red", "blue":
            return UIColor.white
        case "yellow":
            return UIColor.black
        default:
            return UIColor.black // lol
        }
    }
    
    var numberedObjects: [String] {
        return color.thingsOfColor.enumerated().map { "Object #\($0) \($1)"}
    }
    
    var color: Color
    
}
