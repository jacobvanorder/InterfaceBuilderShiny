//
//  IBShinyRoundButton.m
//  IBShiny
//
//  Created by mrJacob on 8/26/14.
//  Copyright (c) 2014 sushiGrass. All rights reserved.
//

#import "IBShinyRoundButton.h"

static CGFloat StaticExtrudeYValue = 6;

@implementation IBShinyRoundButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commonSetupCode];
}

- (void)prepareForInterfaceBuilder
{
    [super prepareForInterfaceBuilder];
    [self commonSetupCode];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    CGFloat textBottomYValue = (self.highlighted) ? StaticExtrudeYValue - 6 : (self.buttonHeight + 5.0f);
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 4, textBottomYValue, 4);
    [self setTitleEdgeInsets:edgeInsets];
    [self setImageEdgeInsets:edgeInsets];
    [self setNeedsDisplay];
}

- (void)commonSetupCode
{
    self.buttonHeight = (self.buttonHeight) ? : 6;
    self.buttonHeight = StaticExtrudeYValue - self.buttonHeight;
    self.topColor = (self.topColor) ? : [UIColor colorWithRed:0.75 green:0.91 blue:0.64 alpha:1];
    self.extrudeColor = (self.extrudeColor) ? : [UIColor colorWithRed:0.49 green:0.73 blue:0.56 alpha:1];
    self.imageTintColor = (self.imageTintColor) ? : [UIColor colorWithRed:0.18 green:0.63 blue:0.53 alpha:1];
    self.shadowColor = (self.shadowColor) ? : [UIColor colorWithWhite:0.0f alpha:0.6f];

}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(90.0f, 90.0f);
}

- (void)drawRect:(CGRect)rect
{
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.imageView.tintColor = self.imageTintColor;
    //// Shadow Drawing
    UIBezierPath* shadowPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rect) + 4, CGRectGetMinY(rect) + 8, CGRectGetWidth(rect) - 8, CGRectGetHeight(rect) - 8)];
    [self.shadowColor setFill];
    [shadowPath fill];
    
    
    //// Extrude Drawing
    UIBezierPath* extrudePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rect) + 4, CGRectGetMinY(rect) + StaticExtrudeYValue, CGRectGetWidth(rect) - 8, CGRectGetHeight(rect) - 8)];
    [self.extrudeColor setFill];
    [extrudePath fill];
    
    
    //// Top Drawing
    CGFloat topYValue = (self.highlighted) ? StaticExtrudeYValue : (CGRectGetMinY(rect) + self.buttonHeight);
    UIBezierPath* topPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rect) + 4, topYValue, CGRectGetWidth(rect) - 8, CGRectGetHeight(rect) - 8)];
    [self.topColor setFill];
    [topPath fill];
}

@end
