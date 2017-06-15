//
//  RNConfettiView.h
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

@import UIKit;
@import QuartzCore;

typedef NS_ENUM(NSUInteger, ConfettiType) {
    ConfettiTypeConfetti = 0,
    ConfettiTypeTriangle = 1,
    ConfettiTypeStar = 2,
    ConfettiTypeDiamond = 3
};

@interface ConfettiView : UIView

- (instancetype)initWithFrame:(CGRect)frame;
- (void)setType:(ConfettiType)type;
- (void)start;
- (void)stop;
- (BOOL)isActive;
- (void)setIntensity:(float)intensity;

@end
