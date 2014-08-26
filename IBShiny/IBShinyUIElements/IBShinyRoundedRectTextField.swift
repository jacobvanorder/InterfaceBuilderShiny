//
//  IBShinyRoundedRectTextField.swift
//  IBShiny
//
//  Created by mrJacob on 8/25/14.
//  Copyright (c) 2014 sushiGrass. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable

public class IBShinyRoundedRectTextField: UITextField {
    
    @IBInspectable public var fillColor : UIColor = UIColor(red: 1.0, green: 0.99, blue: 0.64, alpha: 1.0)
    @IBInspectable public var strokeColor : UIColor = UIColor(red: 0.75, green: 0.91, blue: 0.64, alpha: 1.0)
    
    @IBInspectable public var errorStatefillColor : UIColor = UIColor(red: 0.97, green: 0.38, blue: 0.25, alpha: 1.0)
    @IBInspectable public var errorStateStrokeColor : UIColor = UIColor(red: 1, green: 0.99, blue: 0.64, alpha: 1.0)
    
    @IBInspectable public var customTextColor : UIColor = UIColor(red: 0.49, green: 0.73, blue: 0.56, alpha: 1)
    
    @IBInspectable public var strokeWidth : CGFloat = 1
    @IBInspectable public var cornerRadius : CGFloat = 3.0
    @IBInspectable public var isErrorState : Bool = false {
        didSet {
            self.textColor = (isErrorState) ? errorStateStrokeColor : customTextColor
            self.drawRect(self.bounds)
        }
    }
    @IBInspectable public var glyphImage : UIImage?
    @IBInspectable public var glyphImageLeftPad : CGFloat = 5.0;
    @IBInspectable public var textLeftPad : CGFloat = 5.0
    
    private let glyphImageView : UIImageView = UIImageView(frame: CGRectZero)
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        commonIBCode()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonIBCode()
    }
    
    func commonIBCode() {
        self.textColor = customTextColor
        glyphImageView.setTranslatesAutoresizingMaskIntoConstraints(false);
        if let checkedImage = glyphImage {
            glyphImageView.image = checkedImage.imageWithRenderingMode(.AlwaysTemplate)
        }
        self.addSubview(glyphImageView)
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(pad)-[glyph]", options:NSLayoutFormatOptions(0) , metrics: ["pad" : glyphImageLeftPad], views: ["glyph" : glyphImageView]))
        self.addConstraint(NSLayoutConstraint(item: glyphImageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
    
    override public func intrinsicContentSize() -> CGSize {
        return CGSizeMake(self.bounds.width, 50.0)
    }
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(glyphImageView.bounds.width + glyphImageLeftPad + textLeftPad, 0.0, bounds.width, bounds.height)
    }
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        return self.textRectForBounds(bounds)
    }
    
    override public func drawRect(rect: CGRect) {
        let rectanglePath = UIBezierPath(roundedRect: CGRectInset(rect, strokeWidth, strokeWidth), cornerRadius: cornerRadius)
        
        if (!isErrorState) {
            fillColor.setFill()
        } else {
            errorStatefillColor.setFill()
        }
        rectanglePath.fill()
        
        if (!isErrorState) {
            strokeColor.setStroke()
        } else {
            errorStateStrokeColor.setStroke()
        }
        
        rectanglePath.lineWidth = strokeWidth
        rectanglePath.stroke()
        
        self.glyphImageView.tintColor = (isErrorState) ? errorStateStrokeColor : strokeColor
    }

}
