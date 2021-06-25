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
