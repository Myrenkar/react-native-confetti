package co.netguru.android.react.wifistate;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import co.netguru.android.react.wifistate.implementation.WifiStateUtil;

public class WifiStateModule extends ReactContextBaseJavaModule {

    private static final String MODULE_NAME = "WifiStateModule";

    public WifiStateModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return MODULE_NAME;
    }

    /**
     * Checks if device is connected through wifi network.
     *
     * @param callback calls true if connected through wifi
     */
    @ReactMethod
    public void isConnectedThroughWifi(Callback callback) {
        final boolean isConnectedThroughWifi =
                WifiStateUtil.getIsConnectedThroughWifi(getReactApplicationContext());

        callback.invoke(isConnectedThroughWifi);
    }
}
