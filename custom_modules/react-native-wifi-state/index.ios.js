/**
 * @providesModule RNWifiState
 * @flow
 */
'use strict';

import {NativeModules, DeviceEventEmitter} from 'react-native';
const NativeWifiStateModule = NativeModules.RNWifiState;

/**
 * Component allowing to perform and export preview of specified audio file.
 */

var RNWifiState = {
    isConnectedThroughWifi: function (callback: (isConnected: boolean) => void) {
        NativeWifiStateModule.isConnectedThroughWifi(callback)
    }
}

module.exports = RNWifiState;
