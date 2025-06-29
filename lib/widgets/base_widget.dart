import 'dart:ui';

import 'package:flutter/material.dart';

class BaseWidget {
  static TextStyle mainTextStyle(
      {double size = 14,
      Color colors = Colors.black,
      FontWeight fWeight = FontWeight.normal}) {
    return TextStyle(color: colors, fontSize: size, fontWeight: fWeight);
  }

  static TextStyle h1TextStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal);
  }

  static void push(BuildContext ctx, Widget widget) {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) => widget));
  }

  static void showSnackBar(BuildContext ctx, String message){
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
  }
}
