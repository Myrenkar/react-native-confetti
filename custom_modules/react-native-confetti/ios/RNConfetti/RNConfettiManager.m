//
//  RNConfetti.m
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import <React/RCTBridge.h>
#import <React/UIView+React.h>
#import "RNConfettiManager.h"
#import "RNConfettiView.h"


@interface RNConfettiManager()

@end

@implementation RNConfettiManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    RCTLogError(@"test");
    RNConfettiView *confetti = [[RNConfettiView alloc] init];
    [confetti start];
    return confetti;
}

RCT_EXPORT_METHOD(stop) {
   // [self.confetti stop];
    RCTLogError(@"test");

}

RCT_EXPORT_METHOD(setIntensity:(float)intensity withCallback:(RCTResponseSenderBlock)callback) {
   /* if (callback) {
        [self.confetti setIntensity:intensity];
        callback(@[@YES]);
    }*/
}

RCT_EXPORT_METHOD(isActiveWithCallback:(RCTResponseSenderBlock)callback) {
   /* if (callback) {
        BOOL isActive = [self.confetti isActive];

        callback(@[isActive == YES ? @YES : @NO]);
    }*/
}

RCT_EXPORT_METHOD(start:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        RNConfettiView *confetti = (RNConfettiView *)viewRegistry[reactTag];
        NSLog(@"View type %@",confetti);
        if (![confetti isKindOfClass:[RNConfettiView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting ConfettiView, got: %@", viewRegistry);
        } else {
            [confetti start];
        }
    }];
}

@end
