import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:touchable/touchable.dart';

import '../../core/GenerateRound.dart';

import "../widgets/Logo.dart";

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final GlobalKey scaffoldKey = GlobalKey();
  RoundData data;
  int points = 0;

  @override
  void initState() {
    reset();
    super.initState();
  }

  void reset() {
    setState(() {
      points = 0;
      data = generateRound();
    });
  }

  void guess(BuildContext context, String name) {
    HapticFeedback.lightImpact();
    if (data.options[data.correct] == name) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                size: 80,
              ),
              Container(width: 10),
              Text(
                "Correct!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

      setState(() {
        points++;
        data = generateRound();
      });
    } else {
      lost();
    }
  }

  void lost() {
    HapticFeedback.vibrate();
    reset();
    Navigator.pushNamed(context, "/lost");
  }

  void onShapeTap() async {
    HapticFeedback.heavyImpact();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              // receive hero cross-screen animation for title
              Logo(
                title: "shapeblinder",
                subtitle: "current score: $points | high: 3",
              ),
              Spacer(),
              Container(
                height: width / 1.25,
                width: width / 1.25,
                child: CanvasTouchDetector(
                  builder: (context) {
                    return CustomPaint(
                      painter: getWidgetForName(
                        context,
                        onShapeTap,
                        data.options[data.correct],
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  "select the shape that you feel",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Container(
                height: 14,
              ),
              Builder(
                builder: (context) => RaisedButton(
                  child: Opacity(
                    opacity: 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ...data.options.map(
                          (e) => Container(
                            height: width / 5,
                            width: width / 5,
                            child: GestureDetector(
                              onTap: () => guess(context, e),
                              child: SvgPicture.asset(
                                "assets/svg/$e.svg",
                                semanticsLabel: '$e icon',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
