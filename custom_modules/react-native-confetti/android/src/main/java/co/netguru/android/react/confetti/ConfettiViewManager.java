package co.netguru.android.react.confetti;

import android.graphics.Color;
import android.os.Handler;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;

import java.util.Map;

import javax.annotation.Nullable;

import nl.dionsegijn.konfetti.KonfettiView;
import nl.dionsegijn.konfetti.ParticleSystem;
import nl.dionsegijn.konfetti.emitters.StreamEmitter;
import nl.dionsegijn.konfetti.models.Shape;

public class ConfettiViewManager extends SimpleViewManager<KonfettiView> {

    private static final String VIEW_NAME = "ConfettiView";
    private static final int START_COMMAND_ID = 1;

    @Override
    public String getName() {
        return VIEW_NAME;
    }

    @Override
    protected KonfettiView createViewInstance(ThemedReactContext reactContext) {
        final KonfettiView konfettiView = new KonfettiView(reactContext);
        konfettiView.build()
                .addColors(Color.YELLOW, Color.GREEN, Color.MAGENTA)
                .setSpeed(1f, 5f)
                .setPosition(0,300)
                .setFadeOutEnabled(true)
                .addShapes(Shape.RECT, Shape.CIRCLE)
                .setPosition(0f, 0f, 0f, 0f)
                .stream(300, Long.MAX_VALUE);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                for (ParticleSystem particleSystem : konfettiView.getSystems()) {
                    ((StreamEmitter) particleSystem.emitter).setEmittingTime$konfetti_release(0);
                }
            }
        }, 10000);
        return konfettiView;
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
