//
//  RNConfetti.m
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import "RNConfetti.h"
#import "ConfettiView.h"

@interface RNConfetti()

@property (strong, nonatomic) ConfettiView *confetti;

@end

@implementation RNConfetti


- (instancetype)init {
    self = [super init];

    if (self) {

    }

    return self;
}

RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(initWithFrame:(CGRect)frame) {
    self.confetti = [[ConfettiView alloc] initWithFrame:frame];
}

RCT_EXPORT_METHOD(startWithCallback:(RCTResponseSenderBlock)callback) {
    if (callback) {
        [self.confetti start];
        callback(@[@YES]);
    }
}

RCT_EXPORT_METHOD(stopWithCallback:(RCTResponseSenderBlock)callback) {
    if (callback) {
        [self.confetti stop];
        callback(@[@YES]);
    }
}

RCT_EXPORT_METHOD(setIntensity:(float)intensity withCallback:(RCTResponseSenderBlock)callback) {
    if (callback) {
        [self.confetti setIntensity:intensity];
        callback(@[@YES]);
    }
}

RCT_EXPORT_METHOD(isActiveWithCallback:(RCTResponseSenderBlock)callback) {
    if (callback) {
        BOOL isActive = [self.confetti isActive];

        callback(@[isActive == YES ? @YES : @NO]);
    }
}

@end
