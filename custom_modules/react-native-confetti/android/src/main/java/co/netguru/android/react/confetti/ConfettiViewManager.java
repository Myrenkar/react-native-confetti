package co.netguru.android.react.confetti;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;

import java.util.Map;

import javax.annotation.Nullable;

import co.netguru.android.react.confetti.implementation.ConfettiView;

public class ConfettiViewManager extends SimpleViewManager<ConfettiView> {

    private static final String VIEW_NAME = "ConfettiView";
    private static final int START_COMMAND_ID = 1;
    private static final int STOP_COMMAND_ID = 2;

    @Override
    public String getName() {
        return VIEW_NAME;
    }

    @Override
    protected ConfettiView createViewInstance(ThemedReactContext reactContext) {
        return new ConfettiView(reactContext);
    }

    @Nullable
    @Override
    public Map<String, Integer> getCommandsMap() {
        return MapBuilder.of("start", START_COMMAND_ID, "stop", STOP_COMMAND_ID);
    }

    @Override
    public void receiveCommand(ConfettiView root, int commandId, @Nullable ReadableArray args) {
        switch (commandId) {
            case START_COMMAND_ID:
                root.startIndefinite();
                break;
            case STOP_COMMAND_ID:
                root.stop();
                break;
            default:
                throw new IllegalArgumentException("Unknown command");
        }
    }

    /*@ReactProp(name = "confettiColors", customType = "ColorArray")
    public void setConfettiColors();*/
}
