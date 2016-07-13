//
//  LayoutParser.swift
//  xmlLayoutTest
//
//  Created by jason debottis on 7/13/16.
//  Copyright © 2016 jason debottis. All rights reserved.
//

import UIKit

class LayoutGenerator: NSObject, NSXMLParserDelegate {

    var parser = NSXMLParser()
    
    var foundCharacters = [String]()
    
    var elements = [Element]()
    
    var parent = UIView()
    
    override init(){
        super.init()
    }
    
    func openFile(xmlFileToOpen:String, complete:(xmlData:NSData, open:Bool)->Void, failure:(NSError)->Void) -> Void {
        do{
            let path = NSBundle.mainBundle().pathForResource(xmlFileToOpen, ofType: "xml")
            let xmlData = try NSData(contentsOfFile: path!, options: .DataReadingMapped)
            complete(xmlData: xmlData, open: true)
        }catch let error as NSError{
            failure(error)
        }
    }
    
    func generateUIElements() -> Void {
        print("Elements number:\(elements.count)")
        for element in elements{
            print("element type \(element.type!)")
            if element.type! == .Label {
                
            }
        }
    }

    func parser(parser: NSXMLParser, foundComment comment: String) {
        print("Found Comment:\(comment)")
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        print("Found Characters:\(string)")
        foundCharacters.append(string)
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        let elementTest = Element(typeIn: elementName, attributesIn: attributeDict, parent: self.view)
        elements.append(elementTest)
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("Element end name \(elementName)")
        
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        
    }

}
