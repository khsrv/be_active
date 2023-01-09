import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/widgets/loader/dark_loader.dart';
import 'package:flutter/cupertino.dart';

class BorderButton extends StatefulWidget {
  const BorderButton(
      {super.key,
      this.isLoading = false,
      required this.onTap,
      required this.title,
      this.width,
      this.height});
  final bool isLoading;
  final Function() onTap;
  final String title;
  final double? width;
  final double? height;

  @override
  State<BorderButton> createState() => _BorderButtonState();
}

class _BorderButtonState extends State<BorderButton> {
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
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryColor)),
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? 64,
        child: widget.isLoading
            ? const Center(child: DarkLoader())
            : Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
      ),
    );
  }
}
