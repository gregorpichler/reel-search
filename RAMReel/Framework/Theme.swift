//
//  Theme.swift
//  RAMReel
//
//  Created by Mikhail Stepkin on 4/11/15.
//  Copyright (c) 2015 Ramotion. All rights reserved.
//

import UIKit

// MARK: Theme
/**
Theme
--

Protocol that allows you change visual appearance a bit.
*/
public protocol Theme {
    
    /**
     Text font of both list labels and input textfield.
     */
    var font: UIFont { get }
    /**
     Color of textfield's text.
     
     Suggestion list's text color is calculated using this color by changing alpha channel value to `0.3`.
     */
    var textColor: UIColor { get }
    
    /**
     Color of list's background.
     */
    var listBackgroundColor: UIColor { get }
    
}

/**
 RAMTheme
 --
 
 Theme prefab.
*/
public struct RAMTheme: Theme {
    
    /// Shared theme with default settings.
    public static let sharedTheme = RAMTheme()
    
    /// Theme font.
    public let font: UIFont
    /// Theme text color.
    public let textColor: UIColor
    /// Theme background color.
    public let listBackgroundColor: UIColor
    
    fileprivate init(
        textColor: UIColor = UIColor.black,
        listBackgroundColor: UIColor = UIColor.clear,
        font: UIFont = RAMTheme.defaultFont
        )
    {
        self.textColor = textColor
        self.listBackgroundColor = listBackgroundColor
        self.font = font
    }
    
    fileprivate static var defaultFont: UIFont = RAMTheme.initDefaultFont()
    
    fileprivate static func initDefaultFont() -> UIFont {
        return UIFont.systemFont(ofSize: 36, weight: UIFontWeightThin)
    }
    
    /** 
    Creates new theme with new text color.
     
    - parameter textColor: New text color.
    - returns: New `RAMTheme` instance.
     */
    public func textColor(_ textColor: UIColor) -> RAMTheme {
        return RAMTheme(textColor: textColor, listBackgroundColor: self.listBackgroundColor, font: self.font)
    }
    
    /**
     Creates new theme with new background color.
     
     - parameter listBackgroundColor: New background color.
     - returns: New `RAMTheme` instance.
     */
    public func listBackgroundColor(_ listBackgroundColor: UIColor) -> RAMTheme {
        return RAMTheme(textColor: self.textColor, listBackgroundColor: listBackgroundColor, font: self.font)
    }
    
    /**
     Creates new theme with new font.
     
     - parameter font: New font.
     - returns: New `RAMTheme` instance.
     */
    public func font(_ font: UIFont) -> RAMTheme {
        return RAMTheme(textColor: self.textColor, listBackgroundColor: self.listBackgroundColor, font: font)
    }
    
}

