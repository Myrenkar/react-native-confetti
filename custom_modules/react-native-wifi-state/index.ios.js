import React, {Component} from 'react';
import {
    AppRegistry,
    Button,
    StyleSheet,
    Text,
    View,
    Alert
} from 'react-native';
import RNConfetti from './custom_modules/react-native-confetti'
import RNWifiState from './custom_modules/react-native-wifi-state'


export default class Confetti extends Component {

    handlePressStart() {
        this._confetti.start()
    }

    handlePressStop() {
        this._confetti.stop()
    }

    showWifiConnectionState() {
        RNWifiState.isConnectedThroughWifi(isConnectedThroughWifi => {
                this.showWifiStateDialog(isConnectedThroughWifi);
            }
        )
    }

    showWifiStateDialog(isConnectedThroughWifi) {
        Alert.alert(
            'Wifi connection state',
            `Is connected through wifi: ${isConnectedThroughWifi}`,
            [
                {text: 'OK', onPress: () => console.log('OK Pressed')},
            ],
            {cancelable: true}
        )
    }

    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.welcome}>
                    Welcome to React Native!
                </Text>
                <Text style={styles.instructions}>
                    To get started, edit index.android.js
                </Text>
                <Text style={styles.instructions}>
                    Double tap R on your keyboard to reload,{'\n'}
                    Shake or press menu button for dev menu
                </Text>
                <RNConfetti
                    ref={component => this._confetti = component}
                    style={styles.overlay}
                    confettiColors={['lime', 'darkorange', 'yellow']}
                    confettiShapes={[RNConfetti.ConfettiShapes.CIRCLE, RNConfetti.ConfettiShapes.RECT]}
                />
                <Button
                    title={"Press to start"}
                    onPress={() => this.handlePressStart()}
                />
                <Button
                    title={"Press to stop"}
                    onPress={() => this.handlePressStop()}
                />
                <Button
                    title={"Press to check wifi connection state"}
                    onPress={() => this.showWifiConnectionState()}
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
    overlay: {
        position: 'absolute',
        top: 0,
        right: 0,
        bottom: 0,
        left: 0,
        opacity: 1
    }
});

AppRegistry.registerComponent('Confetti', () => Confetti);
