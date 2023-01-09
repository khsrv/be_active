import 'package:be_active/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomDevider extends StatelessWidget {
  final Color? color;

  const CustomDevider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color ?? kBlackColor.withOpacity(0.1)),
      width: MediaQuery.of(context).size.width,
      height: 1,
    );
  }
}
