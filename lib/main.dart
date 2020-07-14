import 'package:flutter/material.dart';

import './ui/screens/Home.dart';
import './ui/screens/Game.dart';
import './ui/screens/Lost.dart';

void main() {
  runApp(Shapeblinder());
}

class Shapeblinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShapeBlinder',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/game': (BuildContext context) => Game(),
        '/lost': (BuildContext context) => Lost(),
      },
    );
  }
}
