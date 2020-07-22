import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:shapeblinder/core/HapticUtilities.dart';
import 'package:touchable/touchable.dart';
import "package:shared_preferences/shared_preferences.dart";

import '../../core/RoundUtilities.dart';
import '../../core/HapticUtilities.dart';
import "../widgets/Layout.dart";
import "../widgets/Logo.dart";
import "./Lost.dart";

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final GlobalKey scaffoldKey = GlobalKey();
  RoundData data;
  int points = 0;
  int high = 0;

// the initState method is ran by Flutter when the element is first time painted
// it's like componentDidMount in React
  @override
  void initState() {
    reset();
    loadHigh();
    super.initState();
  }

  void reset() {
    setState(() {
      points = 0;
      data = generateRound();
    });
  }

  void loadHigh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      high = prefs.getInt('high') ?? 0;
    });
  }

  void setHigh(int pts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('high', pts);

    setState(() {
      high = pts;
    });
  }

  void guess(BuildContext context, String name) {
    lightHaptic();

    if (data.options[data.correct] == name) {
      // correct guess!
      correctGuess(context);
    } else {
      // wrong guess
      lost();
    }
  }

  void correctGuess(BuildContext context) {
    // show snackbar
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

    // add one point, generate new round
    setState(() {
      points++;
      data = generateRound();
    });
  }

  void lost() {
    vibrateHaptic();

    // if the score is higher than the current high score,
    // update the high score
    if (points > high) {
      setHigh(points);
    }

    // navigate the user to the lost screen
    Navigator.pushNamed(
      context,
      "/lost",
      // pass arguments with this constructor:
      arguments: LostScreenArguments(points),
    );

    // reset the game so that when the user comes back from the "lost" screen,
    // a new, fresh round is ready
    reset();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Layout(
      children: <Widget>[
        Spacer(),
        // receive hero cross-screen animation for title
        Logo(
          title: "shapeblinder",
          subtitle: "current score: $points | high: $high",
        ),
        Spacer(),
        Container(
          height: width / 1.25,
          width: width / 1.25,
          child: CanvasTouchDetector(
            builder: (context) {
              return CustomPaint(
                painter: getPainterForName(
                  context,
                  vibrateHaptic,
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
          builder: (context) => Opacity(
            opacity: 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ],
    );
  }
}
