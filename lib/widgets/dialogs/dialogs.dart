import 'package:flutter/material.dart';

class Dialogs {

  static bool open = false;

  static Future show(BuildContext context, Widget dialog) async {
    return await showDialog(
      context: context, 
      builder: (BuildContext context) {
        return dialog;
      }
    );
  }

  static Future showModal(BuildContext context, Widget dialog) async {
    if (!open) {
      open = true;
      return show(context, dialog);
    }
  }

  static Future showUnmodal(BuildContext context, Widget dialog,) async {
    return show(context, dialog);
  }

  static void hide(BuildContext context) {
    if (open) {
      Navigator.pop(context);
      open = false;
    }
  }
}