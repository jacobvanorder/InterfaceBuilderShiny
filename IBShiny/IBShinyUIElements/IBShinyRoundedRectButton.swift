//
//  IBShinyRoundedRectButton.swift
//  IBShiny
//
//  Created by mrJacob on 8/24/14.
//  Copyright (c) 2014 sushiGrass. All rights reserved.
//

import UIKit

@IBDesignable public class IBShinyRoundedRectButton: UIButton {
    
    @IBInspectable public var buttonCornerRadius : CGFloat = 5.0
    @IBInspectable public var topRectColor : UIColor = UIColor(red: 0.75, green: 0.91, blue: 0.64, alpha: 1)
    @IBInspectable public var extrudeColor : UIColor = UIColor(red: 0.49, green: 0.73, blue: 0.56, alpha: 1)
    @IBInspectable public var shadowColor : UIColor = UIColor(white: 0.0, alpha: 0.6)
        
    override public var highlighted : Bool {
        didSet {
            self.titleEdgeInsets = UIEdgeInsetsMake(highlighted ? 3 : -8, 0, 0, 0);
            setNeedsDisplay()
        }
    }

    override public func drawRect(rect: CGRect) {
            //// Shadow Rect Drawing
            let shadowRectPath = UIBezierPath(roundedRect: CGRectMake(rect.minX, rect.minY + 12, rect.width, rect.height - 12), cornerRadius: buttonCornerRadius)
            shadowColor.setFill()
            shadowRectPath.fill()
        
            //// Extrude Rect Drawing
            let extrudeRectPath = UIBezierPath(roundedRect: CGRectMake(rect.minX, rect.minY + 10, rect.width, rect.height - 12), cornerRadius: buttonCornerRadius)
            extrudeColor.setFill()
            extrudeRectPath.fill()
            
            
            let topYValue = (highlighted) ? rect.minY + 10 : rect.minY
            //// Top Rect Drawing
            let topRectPath = UIBezierPath(roundedRect: CGRectMake(rect.minX, topYValue, rect.width, rect.height - 12), cornerRadius: buttonCornerRadius)
            topRectColor.setFill()
            topRectPath.fill()
    }
}
