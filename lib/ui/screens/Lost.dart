import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "../widgets/Layout.dart";
import "../widgets/Logo.dart";
import "../widgets/Tap.dart";

// passing props to this screen with arguments
// you'll need to construct this class in the sender screen, to
// (in our case, the Game.dart)
class LostScreenArguments {
  final int points;

  LostScreenArguments(this.points);
}

class Lost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // extract the arguments from the previously discussed class
    final LostScreenArguments args = ModalRoute.of(context).settings.arguments;
    // you'll be able to access it by: args.points

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // navigate to the game screen
        HapticFeedback.lightImpact();
        Navigator.pop(context);
      },
      child: Layout(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          // add hero cross-screen animation for title
          Logo(
            title: "you lost",
            // string interpolation with the ${} syntax
            subtitle: "score: ${args.points}",
          ),
          Spacer(),
          Tap(
            title: "tap anywhere to start again",
          ),
        ],
      ),
    );
  }
}
