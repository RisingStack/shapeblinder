import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  // passing named parameters with the ({}) syntax
  // the type is automatically inferred from the type of the variable
  // (in this case, the children prop will have a type of List<Widget>)
  Layout({this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // SafeArea adds padding for device-specific reasons
      // (e.g. bottom draggable bar on some iPhones, etc.)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
