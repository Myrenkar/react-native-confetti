//
//  RNWifiState.m
//  RNWifiState
//
//  Created by Piotr Torczynski on 15/07/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//


#import "RNWifiState.h"
#import "WifiState.h"

@interface RNWifiState()

@end

@implementation RNWifiState

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(isConnectedThroughWifi:(RCTResponseSenderBlock)callback) {
    if (callback) {
        WifiState *state = [[WifiState alloc] init];
        if ([state isConnectedToWiFi]) {
            callback(@[@YES]);
        } else {
            callback(@[@NO]);
        }
    }
}


@end
