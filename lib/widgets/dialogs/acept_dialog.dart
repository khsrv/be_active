import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/widgets/button/border_button.dart';
import 'package:be_active/widgets/dialogs/main_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AceptDialog extends StatelessWidget {
  final String title;
  final Function onAcept;
  final String infoText;
  const AceptDialog({
    super.key,
    required this.title,
    required this.onAcept,
    required this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return MainDialog(
      title: "",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  infoText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kWhiteColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BorderButton(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 40,
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Отмена',
              ),
              const SizedBox(width: 16,),
              BorderButton(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 40,
                onTap: () {
                  Navigator.pop(context);
                  onAcept();
                },
                title: 'Удалить',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
