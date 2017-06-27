package co.netguru.android.react.wifistate;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

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
        final ConnectivityManager connectivityManager = (ConnectivityManager) getReactApplicationContext()
                .getSystemService(Context.CONNECTIVITY_SERVICE);
        final NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        final boolean isWifiConnected = activeNetworkInfo != null &&
                activeNetworkInfo.getType() == ConnectivityManager.TYPE_WIFI;

        callback.invoke(isWifiConnected);
    }
}
