import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets shadowPadding;
  final BorderRadius borderRadius;
  final Widget child;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const MainCard(
      {required this.margin,
      required this.borderRadius,
      required this.padding,
      required this.child,
      required this.color,
      required this.shadowPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: shadowPadding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3))
          ],
        ),
        child: child,
      ),
    );
  }
}
