package com.ogieben.okaydemo

import com.okaythis.okaythis_flutter_plugin.OkaythisFlutterPlugin
import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

class OkayDemoApplication : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {

    override fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingService.setPluginRegistrant(this)
        
    }

    override fun registerWith(registry: PluginRegistry?) {
        GeneratedPluginRegistrant.registerWith(registry)
    }
}