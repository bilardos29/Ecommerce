import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double h;
  final double w;
  const Space({this.h = 0, this.w = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return h != 0 ? SizedBox(height: h) : SizedBox(width: w);
  }
}
