/* eslint valid-jsdoc: "error" */
/* eslint max-len: ["error", 100, { "ignoreComments": true }] */

/**
 * @providesModule RNConfetti
 * @flow
 */

import {requireNativeComponent, View, findNodeHandle, ViewPropTypes, NativeModules} from 'react-native';
import React, {Component, PropTypes} from 'react';

var RnConfettiModule = NativeModules.RNConfettiManager

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
        //confettiColors: PropTypes.arrayOf(PropTypes.string),
        // confettiShapes: PropTypes.arrayOf(PropTypes.string)
    }

    start() {
        RnConfettiModule.start(findNodeHandle(this))
    }

    stop() {
        RnConfettiModule.stop(findNodeHandle(this))
    }

    render() {
        return <RNConfettiView {...this.props}/>
    }
}

//RNConfetti.ConfettiShapes = CONFETTI_SHAPES

const RNConfettiView = requireNativeComponent('ConfettiView', RNConfetti);

module.exports = RNConfetti;
