//
//  UILabel+Extension.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UILabel {
    
    func addColor(with textColor: String, color: UIColor){
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text ?? "")
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSMakeRange(0, textColor.count))
        attributedText = attributeString
    }
    
    func addBold(bold: String){
        let main_string = text ?? ""
        let attribute = NSMutableAttributedString.init(string: main_string)
        let range = (main_string as NSString).range(of: bold)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Bold", size: font.pointSize), size: font.pointSize), range: range)
        attributedText = attribute
    }
    
    
    func addStrikethrough(stringStrike: String, stringBoldOne: String, stringBoldTwo: String, colorStrike: UIColor){
        let main_string = text ?? ""
        let attribute = NSMutableAttributedString.init(string: main_string)
        let rangeBoldOne = (main_string as NSString).range(of: stringBoldOne)
        let rangeBoldTwo = (main_string as NSString).range(of: stringBoldTwo)
        let strike = (main_string as NSString).range(of: stringStrike)
        
        attribute.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 3, range: strike)
        attribute.addAttribute(NSAttributedString.Key.baselineOffset, value: 0, range: strike)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Bold", size: font.pointSize), size: font.pointSize), range: rangeBoldOne)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Bold", size: font.pointSize), size: font.pointSize), range: rangeBoldTwo)
        
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: colorStrike, range: strike)
        
        attributedText = attribute
    }
}