package com.releasebirdreactnativesdk;

import android.app.Application;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import java.util.Map;

public class ReleasebirdsdkModule extends ReactContextBaseJavaModule {

    public ReleasebirdsdkModule(ReactApplicationContext context) {
        super(context);
    }

    @ReactMethod
    public void initialize(String apiKey, Application application) {
        com.releasebird.releasebird_sdk.Releasebird.init(apiKey, application);
    }

    @ReactMethod
    public void showWidget() {
        com.releasebird.releasebird_sdk.Releasebird.getInstance().showWidget();
    }

    @ReactMethod
    public void identify(String hash, Map<String, Object> identifyJson) {
        com.releasebird.releasebird_sdk.Releasebird.getInstance().identify(hash, identifyJson);
    }

    @NonNull
    @Override
    public String getName() {
        return "Releasebirdsdk";
    }
}
