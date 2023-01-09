import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkLoader extends StatelessWidget {
  const DarkLoader({Key? key, this.radius = 10}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            cupertinoOverrideTheme:
                const CupertinoThemeData(brightness: Brightness.light)),
        child: const CupertinoActivityIndicator());
  }
}
