import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/base_widget.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';

class ReviewWidget extends StatelessWidget {
  final double rate;
  final double size;
  final Color color;

  const ReviewWidget(this.rate,
      {this.size = 14, this.color = Colors.black, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.star,
        color: Colors.orange,
        size: size,
      ),
      const Space(w: 4),
      Text(
        '$rate',
        style: BaseWidget.mainTextStyle(colors: color),
      ),
    ]);
  }
}
