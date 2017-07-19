//
//  RCTConvert+ConfettiType.m
//  RNConfetti
//
//  Created by Piotr Torczynski on 19/07/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import "RCTConvert+ConfettiType.h"

@implementation RCTConvert (ConfettiType)
    RCT_ENUM_CONVERTER(ConfettiType,
        (@{
            @"confetti" : @(ConfettiTypeConfetti),
            @"triangle" : @(ConfettiTypeTriangle),
            @"star" : @(ConfettiTypeStar),
            @"diamond" : @(ConfettiTypeDiamond),
        }),
    ConfettiTypeConfetti, integerValue)

@end
