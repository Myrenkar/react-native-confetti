/* eslint valid-jsdoc: "error" */
/* eslint max-len: ["error", 100, { "ignoreComments": true }] */

/**
 * @providesModule RNConfetti
 * @flow
 */

import {requireNativeComponent, View, findNodeHandle, ViewPropTypes} from 'react-native';
import React, {Component, PropTypes} from 'react';

const CONFETTI_SHAPES = {
    CIRCLE: 'circle',
    RECT: 'rect'
}

var UIManager = require('UIManager');
/**
 * Component allowing to perform create and configure confetti effect.
 */
class RNConfetti extends Component {

    static propTypes = {
        ...View.propTypes,
        confettiColors: PropTypes.arrayOf(PropTypes.string),
        confettiShapes: PropTypes.arrayOf(PropTypes.string)
    }

    start() {
        UIManager.dispatchViewManagerCommand(
            findNodeHandle(this),
            UIManager.ConfettiView.Commands.start,
            []
        )
    }

    stop() {
        UIManager.dispatchViewManagerCommand(
            findNodeHandle(this),
            UIManager.ConfettiView.Commands.stop,
            []
        )
    }

    render() {
        return <ConfettiView {...this.props}/>
    }
}

RNConfetti.ConfettiShapes = CONFETTI_SHAPES

const ConfettiView = requireNativeComponent('ConfettiView', RNConfetti);

module.exports = RNConfetti;
