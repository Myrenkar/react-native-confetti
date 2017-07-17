//
//  RNConfettiView.h
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

@import UIKit;

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

@interface ConfettiView : UIView

/**
 Instantiate the receiver

 @param frame frame to used
 @return instantiated receiver
 */
- (instancetype)initWithFrame:(CGRect)frame;
- (void)setTypeValue:(ConfettiType)type;

/**
 Configures the confetti with specific type

 @param type confetti type
 */
- (void)configureType:(ConfettiType)type;

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
