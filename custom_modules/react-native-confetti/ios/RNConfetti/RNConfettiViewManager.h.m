//
//  RNConfetti.m
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import "RNConfettiViewManager.h"
#import "RNConfettiView.h"


@implementation RNConfettiViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    RNConfettiView *confetti = [[RNConfettiView alloc] init];
    return confetti;
}

RCT_EXPORT_METHOD(stop:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        RNConfettiView *confetti = (RNConfettiView *)viewRegistry[reactTag];
        if (![confetti isKindOfClass:[RNConfettiView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting ConfettiView, got: %@", viewRegistry);
        } else {

            [confetti stop];
        }
    }];
}

RCT_EXPORT_METHOD(start:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        RNConfettiView *confetti = (RNConfettiView *)viewRegistry[reactTag];
        if (![confetti isKindOfClass:[RNConfettiView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting ConfettiView, got: %@", viewRegistry);
        } else {
            confetti.frame = [[UIScreen mainScreen] bounds];
            [confetti start];
        }
    }];
}

@end
