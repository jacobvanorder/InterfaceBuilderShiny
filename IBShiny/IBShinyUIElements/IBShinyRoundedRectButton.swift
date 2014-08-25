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
    @IBInspectable public var topRectColor : UIColor = UIColor(red: 0.98, green: 0.81, blue: 0.36, alpha: 1)
    @IBInspectable public var extrudeColor : UIColor = UIColor(red: 0.88, green: 0.56, blue: 0.21, alpha: 1)
    @IBInspectable public var shadowColor : UIColor = UIColor(white: 0.0, alpha: 0.6)
    @IBInspectable public var strokeWidth : CGFloat = 3
    
    override public var highlighted : Bool {
        didSet {
            self.titleEdgeInsets = UIEdgeInsetsMake(highlighted ? 3 : -8, 0, 0, 0);
            setNeedsDisplay()
        }
    }
    
    override public func drawRect(rect: CGRect) {
            //// Shadow Rect Drawing
            let shadowRectPath = UIBezierPath(roundedRect: CGRectMake(frame.minX, frame.minY + 12, frame.width, frame.height - 12), cornerRadius: buttonCornerRadius)
            shadowColor.setFill()
            shadowRectPath.fill()
            
            
            //// Extrude Rect Drawing
            let extrudeRectPath = UIBezierPath(roundedRect: CGRectMake(frame.minX, frame.minY + 10, frame.width, frame.height - 12), cornerRadius: buttonCornerRadius)
            extrudeColor.setFill()
            extrudeRectPath.fill()
            
            
            let topYValue = (highlighted) ? frame.minY + 10 : frame.minY
            //// Top Rect Drawing
            let topRectPath = UIBezierPath(roundedRect: CGRectMake(frame.minX, topYValue, frame.width, frame.height - 12), cornerRadius: buttonCornerRadius)
            topRectColor.setFill()
            topRectPath.fill()
    }
}
