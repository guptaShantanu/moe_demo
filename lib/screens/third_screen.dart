import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moengage_flutter/moengage_flutter.dart';
import 'package:moengage_flutter/properties.dart';

class ThirdScreen extends StatefulWidget {
  final MoEngageFlutter moEngageFlutter;

  const ThirdScreen({Key key, this.moEngageFlutter}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  StreamSubscription onMessageSubscription;
  StreamSubscription onMessageOpenedApp;

  static Future<void> backgroundMessageHandler(RemoteMessage message) async {
    print("Background recieved message ${message.data}");

  }


  void initFirebaseListeners(){
    onMessageSubscription = FirebaseMessaging.onMessage.listen((event) {
      //TOdO: Handle RemoteMessage when app is in the foreground. Show a HUD notification?
      print(
          'ℹ onMessage event listener callback running with data = ${event.data.toString()} ');
    });

    onMessageOpenedApp =
        FirebaseMessaging.onMessageOpenedApp.listen((event) async {
          print("ℹ onMessageOpenedApp event listener callback running");

        //   await processUriLinkOpenIntent(event.data,
        //       executedFromNotification: true);
        });

    // Top level function
    // FirebaseMessaging.onBackgroundMessage(
    //     _ThirdScreenState.backgroundMessageHandler);
  }

  @override
  void initState() {
    initFirebaseListeners();
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
                  widget.moEngageFlutter.trackEvent(
                      'message_us_header_icon_clicked_on_home_screen',
                      MoEProperties());
                },
                child: Text('Track Event'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
