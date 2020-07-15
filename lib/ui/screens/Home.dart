import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "../widgets/Logo.dart";
import "../widgets/Tap.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        // tapping on empty spaces would not trigger the onTap without this
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // navigate to the game screen
          HapticFeedback.lightImpact();
          Navigator.pushNamed(context, "/game");
        },
        // SafeArea adds padding for device-specific reasons
        // (e.g. bottom draggable bar on some iPhones, etc.)
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  title: "tap anywhere to start again",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
