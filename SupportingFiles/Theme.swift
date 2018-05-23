//
//  Theme.swift
//  Tnews
//
//  Created by sriram on 23/05/18.
//  Copyright © 2018 sriram. All rights reserved.
//

import Foundation
import UIKit


struct Theme {
    
    
    var themeArray : [UIColor] = [
        
        UIColor.black,
        UIColor(red:0.56, green:0.07, blue:1.00, alpha:1.0),
        UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0),
        UIColor(red:0.13, green:0.21, blue:1.00, alpha:1.0),
        UIColor(red:0.80, green:0.27, blue:0.57, alpha:1.0)
        
        
    ]
    
    
    
    
    mutating func giveNextColor() -> UIColor {
        let tempColor = themeArray.removeLast()
        themeArray.insert(tempColor, at: 0)
        return tempColor
        
    }
    
    
}
