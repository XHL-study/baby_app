package com.angelbaby.baby_app;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    ///channel name
    private final String chanel = "android.back.desktop";
    ///back desktop event name
    static final String eventBackDesktop = "backdesktop";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        initBackDesktop();
    }

    //init back desktop function
    private void initBackDesktop() {
        new MethodChannel(getFlutterView(), chanel).setMethodCallHandler(
                (methodCall, result) -> {
                    if (methodCall.method.equals(eventBackDesktop)) {
                        moveTaskToBack(false);
                        result.success(true);
                    }
                }
        );
    }
}
