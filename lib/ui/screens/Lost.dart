import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_svg/flutter_svg.dart";

import "../widgets/Logo.dart";

class Lost extends StatelessWidget {
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
                  title: "you lost",
                  subtitle: "score: 0",
                ),
                Spacer(),
                Center(
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
                        "tap anywhere to start again",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        "best score: 0",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
