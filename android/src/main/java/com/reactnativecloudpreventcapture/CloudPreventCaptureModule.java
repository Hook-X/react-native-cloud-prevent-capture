package com.reactnativecloudpreventcapture;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

@ReactModule(name = CloudPreventCaptureModule.NAME)
public class CloudPreventCaptureModule extends ReactContextBaseJavaModule {
    public static final String NAME = "CloudPreventCapture";

    public CloudPreventCaptureModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @Override
    public Map<String, Object> getConstants() {
       final Map<String, Object> constants = new HashMap<>();
       constants.put("ON_SCREENSHOT", "ON_SCREENSHOT");
       constants.put("ON_SCREEN_CAPTURE", "ON_SCREEN_CAPTURE");
       return constants;
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    public void multiply(int a, int b, Promise promise) {
        promise.resolve(a * b);
    }

    public static native int nativeMultiply(int a, int b);
}
