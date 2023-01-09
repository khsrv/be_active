import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/widgets/cards/main_card.dart';
import 'package:flutter/material.dart';

class MainDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  // ignore: use_key_in_widget_constructors
  const MainDialog(
      {required this.title,
      required this.child,
      this.margin = EdgeInsets.zero,
      this.padding = const EdgeInsets.only(left: 24, right: 24)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: MainCard(
          padding: const EdgeInsets.only(bottom: 16),
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
          margin: const EdgeInsets.only(bottom: 30),
          shadowPadding: const EdgeInsets.only(bottom: 24),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(title.isNotEmpty)
                Container(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kWhiteColor
                    ),
                  ),
                ),
                Container(
                  padding: padding,
                  child: child,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
