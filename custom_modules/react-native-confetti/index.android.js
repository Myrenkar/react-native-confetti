/* eslint valid-jsdoc: "error" */
/* eslint max-len: ["error", 100, { "ignoreComments": true }] */

/**
 * @providesModule RNConfetti
 * @flow
 */

import {requireNativeComponent, View, findNodeHandle, ViewPropTypes} from 'react-native';
import React, {Component, PropTypes} from 'react';

var UIManager = require('UIManager');
/**
 * Component allowing to perform create and configure confetti effect.
 */
class RNConfetti extends Component {

    static propTypes = {
        ...View.propTypes
    }

    render() {
        return <ConfettiView {...this.props}/>
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
}

const ConfettiView = requireNativeComponent('ConfettiView', RNConfetti);

module.exports = RNConfetti;
