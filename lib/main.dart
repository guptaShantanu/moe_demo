import 'package:flutter/material.dart';
import 'package:imumz_moengage_demo/screens/first_screen.dart';
import 'package:moengage_flutter/inapp_campaign.dart';
import 'package:moengage_flutter/moengage_flutter.dart';
import 'package:moengage_flutter/push_campaign.dart';

void main() {
  runApp(MyApp());
}
 class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MoEngageFlutter moEngageFlutter;

  void _onInAppClick(InAppCampaign message) {
    print("This is a inapp click callback from native to flutter. Payload " +
        message.toString());
  }

  void _onInAppShown(InAppCampaign message) {
    print("This is a callback on inapp shown from native to flutter. Payload " +
        message.toString());
  }

  void _onInAppDismiss(InAppCampaign message) {
    print("This is a callback on inapp dismiss from native to flutter. Payload " +
        message.toString());
  }

  void _onInAppCustomAction(InAppCampaign message) {
    print("This is a callback on inapp custom action from native to flutter. Payload " +
        message.toString());
  }

  void _onInAppSelfHandle(InAppCampaign message) {
    print("This is a callback on inapp self handle from native to flutter. Payload " +
        message.toString());
  }

  @override
  void initState() {
    moEngageFlutter = MoEngageFlutter();
    moEngageFlutter.initialise();
    moEngageFlutter.setUniqueId('7982sdf78934h');
    moEngageFlutter.enableSDKLogs();
    moEngageFlutter.setUpInAppCallbacks(
      onInAppShown: _onInAppShown,
      onInAppClick: _onInAppClick,
      onInAppCustomAction: _onInAppCustomAction,
      onInAppSelfHandle: _onInAppSelfHandle,
      onInAppDismiss: _onInAppDismiss
    );
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
        home: FirstScreen(moEngageFlutter: moEngageFlutter,),
     );
   }
}
