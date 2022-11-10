import 'package:flutter/material.dart';

class Rute {
  static Future<void> push(BuildContext context, Widget child) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => child),
      ),
    );
  }

  static Future<void> pushReplace(BuildContext context, Widget child) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => child),
      ),
    );
  }

  static Future<bool> pop(BuildContext context) async {
    return await Navigator.of(context).maybePop();
  }

  // Snackbar

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snack(
      BuildContext context, String text) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
