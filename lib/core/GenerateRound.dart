import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';

import "./shapepainters/Circle.dart";
import "./shapepainters/Cross.dart";
import "./shapepainters/Donut.dart";
import "./shapepainters/Line.dart";
import "./shapepainters/Oval.dart";
import "./shapepainters/Square.dart";

class RoundData {
  List<String> options;
  int correct;

  RoundData({this.options, this.correct});
}

Random random = new Random();
final List<String> possible = [
  "circle",
  "cross",
  "donut",
  "line",
  "oval",
  "square"
];

dynamic getWidgetForName(BuildContext context, Function onTap, String name) {
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
  RoundData data = RoundData();
  List<String> res = new List<String>();
  // new temporary possibility array
  // we can remove possibilities from it
  // so that the same possibility doesn't come up twice
  List<String> temp = possible.map((item) => item).toList();

  // add three random shapes from the temp possibles to the options
  for (int i = 0; i < 3; i++) {
    int randomIndex = random.nextInt(temp.length);
    res.add(temp[randomIndex]);
    temp.removeAt(randomIndex);
  }

  data.options = res;
  data.correct = random.nextInt(3);

  return data;
}
