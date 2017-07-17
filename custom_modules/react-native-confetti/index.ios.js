/* eslint valid-jsdoc: "error" */
/* eslint max-len: ["error", 100, { "ignoreComments": true }] */

/**
 * @providesModule RNConfetti
 * @flow
 */

import React, {Component, PropTypes} from 'react';
import {
    Text,
    View,
    NativeModules,
    requireNativeComponent,
    findNodeHandle,
} from 'react-native';

var RNConfettiManager = NativeModules.RNConfettiManager

const CONFETTI_SHAPES = {
    CIRCLE: 'circle',
    RECT: 'rect'
}
/**
 * Component allowing to perform create and configure confetti effect.
 */
class RNConfetti extends Component {

    static propTypes = {
        ...View.propTypes,
    }

    start() {
        console.log("i am here")
        RNConfettiManager.start(findNodeHandle(this))
    }

    stop() {
        RNConfettiManager.stop(findNodeHandle(this))
    }

    render() {
        return <RNConfettiView {...this.props}/>
    }
}
var RNConfettiView = requireNativeComponent('RNConfettiView', RNConfetti);

module.exports = RNConfetti;
