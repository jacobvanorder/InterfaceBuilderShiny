//
//  IBShinyRoundButton.h
//  IBShiny
//
//  Created by mrJacob on 8/26/14.
//  Copyright (c) 2014 sushiGrass. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface IBShinyRoundButton : UIButton

@property (strong, nonatomic) IBInspectable UIColor *topColor;
@property (strong, nonatomic) IBInspectable UIColor *extrudeColor;
@property (strong, nonatomic) IBInspectable UIColor *imageTintColor;
@property (strong, nonatomic) IBInspectable UIColor *shadowColor;

@property (assign, nonatomic) IBInspectable CGFloat buttonHeight;

@end
