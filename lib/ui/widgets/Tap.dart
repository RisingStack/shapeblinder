import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:shared_preferences/shared_preferences.dart";

class Tap extends StatefulWidget {
  Tap({this.title});

  final String title;

  @override
  _TapState createState() => _TapState();
}

class _TapState extends State<Tap> {
  int high = 0;

  void loadHigh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      high = prefs.getInt('high') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadHigh();

    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 75,
            child: SvgPicture.asset(
              "assets/svg/tap.svg",
              semanticsLabel: 'tap icon',
            ),
          ),
          // give some space between the illuistration and the text:
          Container(
            height: 14,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          Text(
            "best score: $high",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
