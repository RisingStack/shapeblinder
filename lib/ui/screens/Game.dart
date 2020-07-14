import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

import "../widgets/Logo.dart";

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int point;

  void generateRound() {}

  void lost() {
    Navigator.pushNamed(context, "/lost");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
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
                subtitleText: "current score: 0 | high: 3",
              ),
              Spacer(),
              Container(
                height: width / 1.25,
                width: width / 1.25,
                child: SvgPicture.asset(
                  "assets/svg/tap.svg",
                  semanticsLabel: 'tap icon',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: width / 5,
                    width: width / 5,
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        "assets/svg/tap.svg",
                        semanticsLabel: 'tap icon',
                      ),
                    ),
                  ),
                  Container(
                    height: width / 5,
                    width: width / 5,
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        "assets/svg/tap.svg",
                        semanticsLabel: 'tap icon',
                      ),
                    ),
                  ),
                  Container(
                    height: width / 5,
                    width: width / 5,
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        "assets/svg/tap.svg",
                        semanticsLabel: 'tap icon',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
