import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/widgets/loader/dark_loader.dart';
import 'package:flutter/cupertino.dart';

class GradientButton extends StatefulWidget {
  const GradientButton(
      {super.key,
      this.isLoading = false,
      required this.onTap,
      required this.title});
  final bool isLoading;
  final Function() onTap;
  final String title;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (!widget.isLoading) {
          widget.onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16)),
        width: MediaQuery.of(context).size.width,
        height: 64,
        child: widget.isLoading
            ? const Center(child: DarkLoader())
            : Center(
                child: Text(
                  widget.title,
                  
                  style: const TextStyle(fontSize: 15, color: kWhiteColor),
                ),
              ),
      ),
    );
  }
}
