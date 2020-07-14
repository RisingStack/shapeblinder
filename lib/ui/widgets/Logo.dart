import "package:flutter/material.dart";

class Logo extends StatelessWidget {
  Logo({this.subtitleText});

  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "title",
      transitionOnUserGestures: true,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "shapeblinder",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34.0,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitleText,
                style: TextStyle(
                  fontSize: 24.0,
                  // The Color.xy[n] gets a specific shade of the color
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
