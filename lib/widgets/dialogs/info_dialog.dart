import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/widgets/button/border_button.dart';
import 'package:be_active/widgets/dialogs/main_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class InfoDialog extends StatelessWidget {
  final String title;
  final String text;
  final Function onAcept;
  const InfoDialog({
    super.key,
    required this.title,
    required this.text,
    required this.onAcept,
  });

  @override
  Widget build(BuildContext context) {
    return MainDialog(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BorderButton(
                width: MediaQuery.of(context).size.width * 0.4,
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'OK',
              )
            ],
          ),
        ],
      ),
    );
  }
}
