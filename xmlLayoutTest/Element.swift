//
//  Element.swift
//  xmlLayoutTest
//
//  Created by jason debottis on 7/13/16.
//  Copyright © 2016 jason debottis. All rights reserved.
//

import UIKit

public class Element: NSObject {
    
    public var widthAttr = Float()
    public var heightAttr = Float()
    let numberFormatter = NSNumberFormatter()
    public enum Types : String{
        case View  = "View"
        case Label = "Label"
    }

    public var type = Types(rawValue: "View")
    public var attributes:[[String:String]]?
    
    public override init() {
        super.init()
    }
    
    public init(typeIn:String, attributesIn: [String:String], parent: UIView) {
        type = Types(rawValue: typeIn)
        if attributesIn["width"] != nil {
            let width = numberFormatter.numberFromString(attributesIn["width"]!)
            widthAttr = (width?.floatValue)!
        }
        if attributesIn["height"] != nil {
            let height = numberFormatter.numberFromString(attributesIn["height"]!)
            heightAttr = (height?.floatValue)!
        }
        switch type! {
        case .Label:
            let label = UILabel()
            if attributesIn["text"] != nil {
                label.text = attributesIn["text"]
            }
            label.frame = CGRectMake(0, 0, CGFloat(widthAttr), CGFloat(heightAttr))
            parent.addSubview(label)
            print("Displaying label w:\(widthAttr) h:\(heightAttr) text:\(label.text)")
            break
        case .View:
            break
        default:
            break
        }
    }
    
    
}
