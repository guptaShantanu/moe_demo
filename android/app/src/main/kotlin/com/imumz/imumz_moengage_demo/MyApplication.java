package com.imumz.imumz_moengage_demo;

import com.moengage.core.MoEngage;
import com.moengage.core.config.FcmConfig;
import com.moengage.core.config.NotificationConfig;
import com.moengage.flutter.MoEInitializer;

import io.flutter.app.FlutterApplication;

public class MyApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        MoEngage.Builder moEngage = new MoEngage.Builder(this, "WZDCXRA0FVNIOG1MCKP5OCT5")
                .configureNotificationMetaData(new NotificationConfig(
                        R.drawable.launch_background,
                        R.drawable.launch_background,
                        R.color.teal_imumz_logo,
                        null,
                        true,
                        true,
                        true
                )).configureFcm(new FcmConfig(
                       false
                ));
        MoEInitializer.initialize(getApplicationContext(), moEngage);
    }
}