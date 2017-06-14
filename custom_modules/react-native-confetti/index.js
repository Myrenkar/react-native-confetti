/**
 * @providesModule RNConfetti
 */
'use strict'

import { Platform } from 'react-native'

const RNConfetti = (Platform.OS === 'ios')
  ? require('./index.ios.js')
  : require('./index.android.js')

export default RNConfetti
