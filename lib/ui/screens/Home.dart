import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "../widgets/Layout.dart";
import "../widgets/Logo.dart";
import "../widgets/Tap.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // tapping on empty spaces would not trigger the onTap without this
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // navigate to the game screen
        HapticFeedback.lightImpact();
        Navigator.pushNamed(context, "/game");
      },
      child: Layout(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          // add hero cross-screen animation for title
          Logo(
            title: "shapeblinder",
            subtitle: "a game with the lights off",
          ),
          Spacer(),
          Tap(
            title: "tap anywhere to start",
          ),
        ],
      ),
    );
  }
}
