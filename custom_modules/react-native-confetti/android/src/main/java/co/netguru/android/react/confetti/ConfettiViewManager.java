package co.netguru.android.react.confetti;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Nullable;

import co.netguru.android.react.confetti.implementation.ConfettiView;
import nl.dionsegijn.konfetti.models.Shape;

public class ConfettiViewManager extends SimpleViewManager<ConfettiView> {

    private static final String VIEW_NAME = "ConfettiView";

    private static final int START_COMMAND_ID = 1;
    private static final String START_COMMAND_JS_NAME = "start";

    private static final int STOP_COMMAND_ID = 2;
    private static final String STOP_COMMAND_JS_NAME = "stop";

    private static final String SHAPE_CIRCLE_CONSTANT_NAME = "circle";
    private static final String SHAPE_RECT_CONSTANT_NAME = "rect";

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
        final Map<String, Integer> commands = new HashMap<>();
        commands.put(START_COMMAND_JS_NAME, START_COMMAND_ID);
        commands.put(STOP_COMMAND_JS_NAME, STOP_COMMAND_ID);
        return commands;
    }

    @Override
    public void receiveCommand(ConfettiView confettiView, int commandId, @Nullable ReadableArray args) {
        switch (commandId) {
            case START_COMMAND_ID:
                confettiView.startIndefinite();
                break;
            case STOP_COMMAND_ID:
                confettiView.stop();
                break;
            default:
                throw new IllegalArgumentException("Unknown command");
        }
    }

    @ReactProp(name = "confettiColors", customType = "ColorArray")
    public void setConfettiColors(ConfettiView confettiView, @Nullable ReadableArray colors) {
        if (colors != null) {
            final int[] colorsArray = new int[colors.size()];
            for (int i = 0; i < colors.size(); i++) {
                colorsArray[i] = colors.getInt(i);
            }
            confettiView.setColors(colorsArray);
        }
    }

    /**
     * Allows to define confetti shapes currently there are two types available exported as constants:
     * {@value #SHAPE_CIRCLE_CONSTANT_NAME} and {@value #SHAPE_RECT_CONSTANT_NAME}
     */
    @ReactProp(name = "confettiShapes")
    public void setShapes(ConfettiView confettiView, @Nullable ReadableArray readableArray) {
        if (readableArray != null) {
            final Shape[] shapes = new Shape[readableArray.size()];
            for (int i = 0; i < readableArray.size(); i++) {
                switch (readableArray.getString(i)) {
                    case SHAPE_CIRCLE_CONSTANT_NAME:
                        shapes[i] = Shape.CIRCLE;
                        break;
                    case SHAPE_RECT_CONSTANT_NAME:
                        shapes[i] = Shape.RECT;
                        break;
                    default:
                        throw new IllegalArgumentException("Unknown confetti shape type");
                }
            }
            confettiView.setShapes(shapes);
        }
    }
}
