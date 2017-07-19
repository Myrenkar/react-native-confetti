/**
 * @providesModule RNWifiState
 */
'use strict'

import {Platform, NativeModules} from 'react-native'

const NativeWifiStateModule = (Platform.OS === 'ios')
    ? NativeModules.RNWifiState
    : NativeModules.WifiStateModule

/**
 * Component allowing to perform and export preview of specified audio file.
 */
export default class RNWifiState {
    static isConnectedThroughWifi(callback: (isConnected: boolean) => void) {
        NativeWifiStateModule.isConnectedThroughWifi(callback)
    }
}