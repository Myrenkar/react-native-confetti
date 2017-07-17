//
//  WifiState.m
//  RNWifiState
//
//  Created by Piotr Torczynski on 15/07/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import "WifiState.h"
#import "Reachability.h"

@implementation WifiState

- (BOOL)isConnectedToWiFi {

    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachability currentReachabilityStatus];

    return status == ReachableViaWiFi;
}

@end
