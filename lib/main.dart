import 'package:flutter/material.dart';

// import the screens we created in the previous step
import './ui/screens/Home.dart';
import './ui/screens/Game.dart';
import './ui/screens/Lost.dart';

// the entry point to our app
void main() {
  runApp(Shapeblinder());
}

class Shapeblinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShapeBlinder',
      // define the theme data
      // i only added the fontFamily to the default theme
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Muli",
      ),
      home: Home(),
      // add in the routes
      // we'll be able to use them later in the Navigator.pushNamed method
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/game': (BuildContext context) => Game(),
        '/lost': (BuildContext context) => Lost(),
      },
    );
  }
}
