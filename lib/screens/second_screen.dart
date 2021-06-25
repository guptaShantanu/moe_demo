import 'package:flutter/material.dart';
import 'package:imumz_moengage_demo/screens/third_screen.dart';
import 'package:moengage_flutter/moengage_flutter.dart';
import 'package:moengage_flutter/properties.dart';

class SecondScreen extends StatefulWidget {
  final MoEngageFlutter moEngageFlutter;

  const SecondScreen({Key key, this.moEngageFlutter}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                      builder: (context)=>ThirdScreen(
                        moEngageFlutter: widget.moEngageFlutter,
                      )));
                },
                child: Text('Go to 3'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to 1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
