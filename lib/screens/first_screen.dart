import 'package:flutter/material.dart';
import 'package:imumz_moengage_demo/screens/second_screen.dart';
import 'package:moengage_flutter/moengage_flutter.dart';
import 'package:moengage_flutter/properties.dart';

class FirstScreen extends StatefulWidget {
  final MoEngageFlutter moEngageFlutter;

  const FirstScreen({Key key, this.moEngageFlutter}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>SecondScreen(
                        moEngageFlutter: widget.moEngageFlutter,
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
