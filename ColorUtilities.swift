//
//  RGBValues.swift
//  HueMuse
//
//  Created by Pete Connor on 2/20/21.
//

import Foundation
import UIKit


//Convert RGB to HSL

func rgbToHsl(red:CGFloat, green:CGFloat, blue:CGFloat) -> (h:CGFloat, s:CGFloat, l:CGFloat){
        let r:CGFloat = red/255
        let g:CGFloat = green/255
        let b:CGFloat = blue/255
        print("r = \(r), g = \(g), b = \(b)")
        
        let Max:CGFloat = max(r, g, b)
        let Min:CGFloat = min(r, g, b)
 
        //h 0-360
        var h:CGFloat = 0
        if Max == Min {
            h = 0.0
        }else if Max == r && g >= b {
            h = 60 * (g-b)/(Max-Min)
        } else if Max == r && g < b {
            h = 60 * (g-b)/(Max-Min) + 360
        } else if Max == g {
            h = 60 * (b-r)/(Max-Min) + 120
        } else if Max == b {
            h = 60 * (r-g)/(Max-Min) + 240
        }
        print("h = \(h)")
        
        //l 0-1
        let l:CGFloat = (r + g + b) / 3
        print("l = \(l)")
        
        //s 0-1
        var s:CGFloat = 0
        if l == 0 || Max == Min {
            s = 0
        } else if l > 0 && l <= 0.5 {
            s = (Max - Min)/(2*l)
        } else if l > 0.5 {
            s = (Max - Min)/(2 - 2*l)
        }
        print("s = \(s)")
            
        return (h, s, l)
    }

//Get individual RGBA values from RGBA Color

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

//let sampleColor = UIColor(red: 128, green: 205, blue: 98, alpha: 0.9)

//var rgbColor: (r: Int, g: Int, b: Int) = (r: 0, g: 0, b: 0)
