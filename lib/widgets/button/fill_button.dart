import 'package:be_active/widgets/loader/dark_loader.dart';
import 'package:flutter/cupertino.dart';


class FillButton extends StatefulWidget {
  const FillButton(
      {super.key,
      this.isLoading = false,
      required this.onTap,
      required this.title});
  final bool isLoading;
  final Function() onTap;
  final Widget title;

  @override
  State<FillButton> createState() => _FillButtonState();
}

class _FillButtonState extends State<FillButton> {
  get primaryColor => null;

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
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width,
        height: 64,
        child: widget.isLoading
            ? const Center(child: DarkLoader())
            : Center(
                child: widget.title,
              ),
      ),
    );
  }
}
