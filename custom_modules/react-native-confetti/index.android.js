/* eslint valid-jsdoc: "error" */
/* eslint max-len: ["error", 100, { "ignoreComments": true }] */

/**
 * @providesModule RNConfetti
 * @flow
 */

import { NativeModules, DeviceEventEmitter } from 'react-native'

const NativePreviewController = NativeModules.RNConfetti

/**
 * Component allowing to perform create and configure confetti effect.
 */
class RNConfetti {

}

module.exports = new RNConfetti()
