//
//  RNConfettiView.h
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Confetti type enum

 - ConfettiTypeConfetti: confetti type: normal confetti
 - ConfettiTypeTriangle: confetti type: triangle
 - ConfettiTypeStar: confetti type: star
 - ConfettiTypeDiamond: confetti type: diamond
 */
typedef NS_ENUM(NSUInteger, ConfettiType) {
    ConfettiTypeConfetti = 0,
    ConfettiTypeTriangle = 1,
    ConfettiTypeStar = 2,
    ConfettiTypeDiamond = 3
};

@interface RNConfettiView : UIView


/**
 Set type

 @param type type
 */
- (void)setTypeValue:(ConfettiType)type;

/**
 Starts the confetti animation
 */
- (void)start;


/**
 Stops the confetti animation
 */
- (void)stop;

/**
 Checks if confetti is active

 @return boolean if confetti is active.
 */
- (BOOL)isConfettiActive;


/**
 Sets confetti intensity.

 @param intensity intensity to be set.
 */
- (void)setIntensityValue:(float)intensity;

@end
