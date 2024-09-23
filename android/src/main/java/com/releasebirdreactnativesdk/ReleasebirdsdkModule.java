package com.releasebirdreactnativesdk;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.module.annotations.ReactModule;

import org.json.JSONException;
import org.json.JSONObject;

@ReactModule(name = "Releasebirdsdk")
public class ReleasebirdsdkModule extends ReactContextBaseJavaModule {

    public ReleasebirdsdkModule(ReactApplicationContext context) {
        super(context);
    }

    @ReactMethod
    public void initialize(String apiKey, boolean showButton) {
        com.releasebird.releasebird_sdk.Releasebird.init(apiKey, getCurrentActivity().getApplication());
    }

    @ReactMethod
    public void showWidget() {
        com.releasebird.releasebird_sdk.Releasebird.getInstance().showWidget();
    }

    @ReactMethod
    public void identify(String hash, ReadableMap identifyJson) {
        try {
            JSONObject jsonObject = RbirdHelper.convertMapToJson(identifyJson);
            com.releasebird.releasebird_sdk.Releasebird.getInstance().identify(hash, RbirdHelper.jsonToMap(jsonObject.getJSONObject("properties")));
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }

    }

    @NonNull
    @Override
    public String getName() {
        return "Releasebirdsdk";
    }
}
