//
//  RNConfetti.m
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import "RNConfettiViewManager.h"
#import "RNConfettiView.h"
#import "RCTConvert+ConfettiType.h"


@implementation RNConfettiViewManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(confettiType, ConfettiType)


- (UIView *)view {
    RNConfettiView *confetti = [[RNConfettiView alloc] init];
    confetti.backgroundColor = [UIColor clearColor];
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
            [confetti start];
        }
    }];
}

//RCT_EXPORT_METHOD(setType:(ConfettiType)type :(nonnull NSNumber *)reactTag) {
//    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
//        RNConfettiView *confetti = (RNConfettiView *)viewRegistry[reactTag];
//        if (![confetti isKindOfClass:[RNConfettiView class]]) {
//            RCTLogError(@"Invalid view returned from registry, expecting ConfettiView, got: %@", viewRegistry);
//        } else {
//            [confetti setTypeValue:type];
//        }
//    }];
//}

@end
