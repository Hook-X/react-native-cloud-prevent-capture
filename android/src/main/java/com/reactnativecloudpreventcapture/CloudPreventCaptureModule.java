package com.reactnativecloudpreventcapture;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import android.app.Activity;
import android.view.WindowManager;
import java.util.Map;
import java.util.HashMap;
import android.app.Application;
import android.content.Context;

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

    @ReactMethod
    public void startPreventingRecording(Promise promise) {
      getCurrentActivity().runOnUiThread(new Runnable() {
        @Override
        public void run() {
          try {
            getCurrentActivity().getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
            promise.resolve(true);
          }
          catch(Exception e) {
            promise.reject("Start prevent recording error", e);
          }
        }
      });
    }

    @ReactMethod
    public void stopPreventingRecording(Promise promise) {
      getCurrentActivity().runOnUiThread(new Runnable() {
        @Override
        public void run() {
          try {
            getCurrentActivity().getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
            promise.resolve(true);
          } catch(Exception e) {
            promise.reject("Stop prevent recording error", e);
          }
        }
      });
    }

    public static native int nativeMultiply(int a, int b);
}
