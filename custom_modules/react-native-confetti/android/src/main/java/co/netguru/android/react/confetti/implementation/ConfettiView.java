package co.netguru.android.react.confetti.implementation;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.widget.FrameLayout;

import co.netguru.android.react.confetti.R;
import nl.dionsegijn.konfetti.KonfettiView;
import nl.dionsegijn.konfetti.ParticleSystem;
import nl.dionsegijn.konfetti.emitters.Emitter;
import nl.dionsegijn.konfetti.emitters.StreamEmitter;
import nl.dionsegijn.konfetti.models.Shape;

public class ConfettiView extends FrameLayout {

    private static final int PARTICLES_PER_SECOND = 300;
    private static final float MIN_SPEED = 4f;
    private static final float MAX_SPEED = 7f;
    private static final double KONFETTI_MAX_DIRECTION = -359.0;
    private static final double KONFETTI_MIN_DIRECTION = 0.0;

    private boolean isShowingConfetti = false;
    private int[] colors = new int[]{Color.BLUE, Color.RED, Color.GREEN};
    private Shape[] shapes = new Shape[]{Shape.CIRCLE, Shape.RECT};
    private KonfettiView konfettiView;

    public ConfettiView(Context context) {
        super(context);
        init();
    }

    public ConfettiView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public ConfettiView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        inflate(getContext(), R.layout.confetti_view, this);
        konfettiView = (KonfettiView) findViewById(R.id.konfetti_view);
    }

    public void startIndefinite() {
        if (!isShowingConfetti) {
            konfettiView.build()
                    .addColors(colors)
                    .setDirection(KONFETTI_MIN_DIRECTION, KONFETTI_MAX_DIRECTION)
                    .setSpeed(MIN_SPEED, MAX_SPEED)
                    .setFadeOutEnabled(true)
                    .addShapes(shapes)
                    .setPosition(0f, (float) konfettiView.getWidth(), 0f, 0f)
                    .stream(PARTICLES_PER_SECOND, Long.MAX_VALUE);
            isShowingConfetti = true;
        }
    }

    public void stop() {
        if (isShowingConfetti) {
            for (ParticleSystem particleSystem : konfettiView.getSystems()) {
                Emitter emitter = particleSystem.emitter;
                if (emitter instanceof StreamEmitter) {
                    StreamEmitter streamEmitter = (StreamEmitter) emitter;
                    streamEmitter.setEmittingTime$konfetti_release(0);
                }
            }
            isShowingConfetti = false;
        }
    }

    public void setColors(int[] colors) {
        this.colors = colors;
        for (ParticleSystem particleSystem : konfettiView.getSystems()) {
            particleSystem.addColors(colors);
        }
    }

    public void setShapes(Shape[] shapes) {
        this.shapes = shapes;
        for (ParticleSystem particleSystem : konfettiView.getSystems()) {
            particleSystem.addShapes(shapes);
        }
    }
}
