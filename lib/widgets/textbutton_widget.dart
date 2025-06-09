import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const TextButtonWidget(this.text, {required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
