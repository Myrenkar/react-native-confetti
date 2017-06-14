package co.netguru.android.react.confetti;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;

import java.util.Map;

import javax.annotation.Nullable;

import nl.dionsegijn.konfetti.KonfettiView;

public class ConfettiViewManager extends SimpleViewManager<KonfettiView> {

    private static final String VIEW_NAME = "ConfettiView";
    private static final int START_COMMAND_ID = 1;

    @Override
    public String getName() {
        return VIEW_NAME;
    }

    @Override
    protected KonfettiView createViewInstance(ThemedReactContext reactContext) {
        return new KonfettiView(reactContext);
    }

    @Nullable
    @Override
    public Map<String, Integer> getCommandsMap() {
        return MapBuilder.of("start", START_COMMAND_ID);
    }

    @Override
    public void receiveCommand(KonfettiView root, int commandId, @Nullable ReadableArray args) {
        switch (commandId) {
            case START_COMMAND_ID:
                root.start(root.build());
        }
    }
}
