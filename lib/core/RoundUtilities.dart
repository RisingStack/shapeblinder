import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';

import 'shapepainters/Circle.dart';
import 'shapepainters/Cross.dart';
import 'shapepainters/Donut.dart';
import 'shapepainters/Line.dart';
import 'shapepainters/Oval.dart';
import 'shapepainters/Square.dart';

class RoundData {
  List<String> options;
  int correct;

  RoundData({this.options, this.correct});
}

Random random = new Random();

// the names represent all the shapes in the assets/svg directory
final List<String> possible = [
  "circle",
  "cross",
  "donut",
  "line",
  "oval",
  "square"
];

dynamic getPainterForName(BuildContext context, Function onTap, String name) {
  switch (name) {
    case "circle":
      return Circle(context, onTap);
    case "cross":
      return Cross(context, onTap);
    case "donut":
      return Donut(context, onTap);
    case "line":
      return Line(context, onTap);
    case "oval":
      return Oval(context, onTap);
    case "square":
      return Square(context, onTap);
  }
}

RoundData generateRound() {
  // new temporary possibility array
  // we can remove possibilities from it
  // so that the same possibility doesn't come up twice
  List<String> temp = possible.map((item) => item).toList();

  // we'll store possibilities in this array
  List<String> res = new List<String>();

  // add three random shapes from the temp possibles to the options
  for (int i = 0; i < 3; i++) {
    // get random index from the temporary array
    int randomItemIndex = random.nextInt(temp.length);

    // add the randomth item of the temp array to the results
    res.add(temp[randomItemIndex]);

    // remove possibility from the temp array so that it doesn't come up twice
    temp.removeAt(randomItemIndex);
  }

  // create new RoundData instance that we'll be able to return
  RoundData data = RoundData(
    options: res,
    correct: random.nextInt(3),
  );

  return data;
}
