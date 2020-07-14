import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:touchable/touchable.dart';
import '../../core/shapepainters/Oval.dart';

import "../widgets/Logo.dart";

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int point;

  void guess(int index) {
    print("guess: $index");
  }

  void generateRound() {}

  void lost() {
    Navigator.pushNamed(context, "/lost");
  }

  void onShapeTap() {
    print("shape tapped!");
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
                title: "shapeblinder",
                subtitle: "current score: 0 | high: 3",
              ),
              Spacer(),
              Container(
                height: width / 1.25,
                width: width / 1.25,
                child: Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: CanvasTouchDetector(
                      builder: (context) {
                        return CustomPaint(
                          painter: Oval(context, onShapeTap),
                        );
                      },
                    ),
                  ),
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
              Opacity(
                opacity: 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: width / 5,
                      width: width / 5,
                      child: GestureDetector(
                        onTap: () => guess(1),
                        child: SvgPicture.asset(
                          "assets/svg/oval.svg",
                          semanticsLabel: 'arc icon',
                        ),
                      ),
                    ),
                    Container(
                      height: width / 5,
                      width: width / 5,
                      child: GestureDetector(
                        onTap: () => guess(2),
                        child: SvgPicture.asset(
                          "assets/svg/r-square.svg",
                          semanticsLabel: 'circle icon',
                        ),
                      ),
                    ),
                    Container(
                      height: width / 5,
                      width: width / 5,
                      child: GestureDetector(
                        onTap: () => guess(3),
                        child: SvgPicture.asset(
                          "assets/svg/square.svg",
                          semanticsLabel: 'cross icon',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
