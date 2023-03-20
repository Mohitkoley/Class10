import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(BuildContext context, String msg, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
      ),
    );
  }
}
