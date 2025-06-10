import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/base_widget.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const MainButton(this.text, {required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          minimumSize: Size(MediaQuery.of(context).size.width, 52),
          backgroundColor: Colors.redAccent
        ),
        child: Text(text,
            style: BaseWidget.mainTextStyle(colors: Colors.white, size: 16)));
  }
}
