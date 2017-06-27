/**
 * @providesModule RNWifiState
 */
'use strict'

import { Platform } from 'react-native'

const RNWifiState = (Platform.OS === 'ios')
  ? require('./index.ios.js')
  : require('./index.android.js')

export default RNWifiState
