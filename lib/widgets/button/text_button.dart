import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/widgets/loader/dark_loader.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.textColor = primaryColor,
      required this.onTap,
      required this.title,
      this.isLoading = false,
      this.textStyle});
  final Color textColor;
  final Function() onTap;
  final String title;
  final TextStyle? textStyle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isLoading) {
          onTap();
        }
      },
      child: isLoading
          ? const DarkLoader()
          : Text(
              title,
              style: textStyle ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
    );
  }
}
