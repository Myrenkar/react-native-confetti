/* eslint valid-jsdoc: "error" */
/* eslint max-len: ["error", 100, { "ignoreComments": true }] */

/**
 * @providesModule RNConfetti
 * @flow
 */

import {requireNativeComponent, View, ViewPropTypes} from 'react-native';

/**
 * Component allowing to perform create and configure confetti effect.
 */
class RNConfetti {

}

const iface = {
    name: 'ConfettiView',
    propTypes: {
        ...ViewPropTypes
    }
};

module.exports = requireNativeComponent('ConfettiView', iface)
