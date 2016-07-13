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
    
    var containerParent = UIView()
    
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
    
    func generateUIElements(parent: UIView,layout:String) -> Void {
        self.containerParent = parent
        openFile(layout, complete: { (xmlData, open) in
            if open{
                self.parser = NSXMLParser(data: xmlData)
                self.parser.delegate = self
                let success:Bool = self.parser.parse()
                if success {
                    print("Success")
                    print("Elements number:\(self.elements.count)")
                    for element in self.elements{
                        self.containerParent.addSubview(element.getElement())
                        
                    }
                }else{
                    print("failure")
                }
            }
        }) { (error) in
            print("Error:\(error)")
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
        let elementTest = Element(typeIn: elementName, attributesIn: attributeDict, parent: self.containerParent)
        elements.append(elementTest)
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("Element end name \(elementName)")
        
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        
    }

}
