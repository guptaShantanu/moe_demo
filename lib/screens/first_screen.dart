import 'package:flutter/material.dart';
import 'package:imumz_moengage_demo/screens/second_screen.dart';
import 'package:moengage_flutter/inapp_campaign.dart';
import 'package:moengage_flutter/moengage_flutter.dart';
import 'package:moengage_flutter/properties.dart';

class FirstScreen extends StatefulWidget {
  // final MoEngageFlutter moEngageFlutter;
  //
  // const FirstScreen({Key key, this.moEngageFlutter}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  MoEngageFlutter moEngageFlutter;

  void _onInAppClick(InAppCampaign message) {
    print("This is a callback click callback from native to flutter. Payload " +
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
    // TODO: implement initState
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
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                color: Colors.pink,
                onPressed: () {
                  moEngageFlutter.trackEvent(
                      'message_us_header_icon_clicked_on_home_screen',
                      MoEProperties());
                },
                child: Text('Track Event'),
              ),
              FlatButton(
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>SecondScreen(
                        moEngageFlutter: moEngageFlutter,
                      )));
                },
                child: Text('Go to 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
