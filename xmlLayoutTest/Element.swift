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
    public var textAttr = String()
    public var elementView = UIView()
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
        
        if attributesIn["text"] != nil {
            textAttr = attributesIn["text"]!
        }

    }
    
    
    public func getElement()->UIView{
        switch type! {
            case .Label:
                let view = UILabel()
                view.frame = CGRectMake(0, 0, CGFloat(widthAttr), CGFloat(heightAttr))
                view.text = self.textAttr
                return view
                
            case .View:
                let view = UIView()
                view.frame = CGRectMake(0, 0, CGFloat(widthAttr), CGFloat(heightAttr))
                return view
        }
    }
    
}













