import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/models/time_enum.dart';
import 'package:flutter/material.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key, required this.time});
  final TimeEnum time;

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          getText(widget.time),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Экран ${getText(widget.time)}",
        ),
      ),
    );
  }

  String getText(TimeEnum timeEnum) {
    switch (timeEnum) {
      case TimeEnum.morning:
        return "Morning";

      case TimeEnum.day:
        return "Day";

      case TimeEnum.nigt:
        return "Night";
    }
  }
}
